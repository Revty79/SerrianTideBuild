import { NextResponse } from "next/server";
import { pool } from "@/db/client";
import { getSessionUser } from "@/server/session";

// PATCH /api/admin/users/[id]/role
export async function PATCH(
  req: Request,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const user = await getSessionUser();
    if (!user || user.role !== "admin") {
      return NextResponse.json({ ok: false, error: "FORBIDDEN" }, { status: 403 });
    }

    const { id } = await params;
    const body = await req.json().catch(() => null) as any;
    
    if (!body || !body.role) {
      return NextResponse.json({ ok: false, error: "BAD_REQUEST" }, { status: 400 });
    }

    const validRoles = ["admin", "privileged", "universe_creator", "world_developer", "world_builder", "free"];
    if (!validRoles.includes(body.role)) {
      return NextResponse.json({ ok: false, error: "INVALID_ROLE" }, { status: 400 });
    }

    // Prevent admin from demoting themselves
    if (id === user.id && body.role !== "admin") {
      return NextResponse.json({ ok: false, error: "CANNOT_DEMOTE_SELF" }, { status: 400 });
    }

    // Remove all existing roles and add the new one on a single connection.
    const client = await pool.connect();
    try {
      await client.query('BEGIN');

      // Delete existing roles
      await client.query(
        `DELETE FROM user_roles WHERE user_id = $1`,
        [id]
      );

      // Add new role
      await client.query(
        `INSERT INTO user_roles (user_id, role_code) VALUES ($1, $2)`,
        [id, body.role]
      );

      // Update user's updated_at timestamp
      await client.query(
        `UPDATE users SET updated_at = NOW() WHERE id = $1`,
        [id]
      );

      await client.query('COMMIT');
    } catch (err) {
      await client.query('ROLLBACK');
      throw err;
    } finally {
      client.release();
    }

    return NextResponse.json({ ok: true });
  } catch (err) {
    console.error("Update user role error:", err);
    return NextResponse.json({ ok: false, error: "INTERNAL_ERROR" }, { status: 500 });
  }
}
