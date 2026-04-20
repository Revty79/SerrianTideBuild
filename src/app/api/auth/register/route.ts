import { NextResponse } from "next/server";
import { db, schema } from "@/db/client";
import { eq, or } from "drizzle-orm";
import crypto from "crypto";
import { hashPassword } from "@/lib/auth";
import { createSession } from "@/server/session";

// POST /api/auth/register
export async function POST(req: Request) {
  try {
    const body = await req.json().catch(() => null) as
      | { username?: string; email?: string; password?: string }
      | null;

    if (!body) {
      return NextResponse.json({ ok: false, error: "BAD_REQUEST" }, { status: 400 });
    }

    const username = body.username?.trim();
    const email = body.email?.trim().toLowerCase();
    const password = body.password;

    // Basic validation
    if (
      !username || typeof username !== "string" || username.trim().length < 3 ||
      !email || typeof email !== "string" ||
      !password || typeof password !== "string" || password.length < 6
    ) {
      return NextResponse.json({ ok: false, error: "MISSING_OR_INVALID_FIELDS" }, { status: 400 });
    }

    // Uniqueness check
    const existing = await db
      .select({ id: schema.users.id })
      .from(schema.users)
      .where(or(eq(schema.users.username, username), eq(schema.users.email, email)));

    if (existing.length > 0) {
      // Reuse a single error token the UI can recognize
      return NextResponse.json({ ok: false, error: "USERNAME_TAKEN" }, { status: 400 });
    }

    const id = crypto.randomUUID();
    const passwordHash = hashPassword(password);

    await db.transaction(async (tx) => {
      // Ensure default role exists even if seed was skipped.
      await tx.insert(schema.roles).values({
        code: "free",
        name: "Free User",
        description: "Basic access with limited features",
      }).onConflictDoNothing();

      // Create user
      await tx.insert(schema.users).values({
        id,
        username,
        email,
        passwordHash,
        // isActive defaults to true; createdAt/updatedAt default in DB
      });

      // Assign default role
      await tx.insert(schema.userRoles).values({
        userId: id,
        roleCode: "free",
        // grantedAt default in DB
      });
    });

    // Create session (auto-login after registration)
    await createSession(id);

    return NextResponse.json({ ok: true });
  } catch (err) {
    console.error("Register error:", err);
    const code = (err as { code?: string } | null)?.code;
    if (code === "23505") {
      return NextResponse.json({ ok: false, error: "USERNAME_TAKEN" }, { status: 400 });
    }
    return NextResponse.json({ ok: false, error: "INTERNAL_ERROR" }, { status: 500 });
  }
}
