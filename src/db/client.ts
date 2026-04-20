import { Pool } from 'pg';
import { drizzle } from 'drizzle-orm/node-postgres';
import * as schema from './schema';

const connectionString = process.env.DATABASE_URL;

const useSsl =
  process.env.DATABASE_SSL === 'true' ||
  connectionString?.toLowerCase().includes('sslmode=require');

const poolConfig = {
  connectionString: connectionString ?? '',
  max: Number(process.env.DB_POOL_MAX ?? 10),
  idleTimeoutMillis: Number(process.env.DB_IDLE_TIMEOUT_MS ?? 30000),
  connectionTimeoutMillis: Number(process.env.DB_CONNECT_TIMEOUT_MS ?? 10000),
  ssl: useSsl ? { rejectUnauthorized: false } : undefined,
};

// Reuse a single Pool in dev (hot reload safe).
const globalForPool = globalThis as unknown as { __st_pool?: Pool };
const missingDbPool = {
  query() {
    throw new Error('DATABASE_URL is required.');
  },
  connect() {
    throw new Error('DATABASE_URL is required.');
  },
} as unknown as Pool;

export const pool = connectionString
  ? (
      process.env.NODE_ENV === 'production'
        ? new Pool(poolConfig)
        : (globalForPool.__st_pool ??= new Pool(poolConfig))
    )
  : missingDbPool;

// Drizzle instance with our schema
export const db = drizzle(pool, { schema });
export { schema };
