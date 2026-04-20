CREATE TABLE IF NOT EXISTS "calendar_astronomical_events" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"calendar_id" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"day_of_year" integer NOT NULL,
	"event_type" varchar(100) NOT NULL,
	"celestial_body" varchar(255),
	"description" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "calendar_festivals" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"calendar_id" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"day_rule" varchar(255) NOT NULL,
	"description" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "calendar_month_weeks" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"month_id" varchar(36) NOT NULL,
	"week_number" integer NOT NULL,
	"days_in_week" integer NOT NULL,
	"repeat_pattern" boolean DEFAULT false,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "calendar_months" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"calendar_id" varchar(36) NOT NULL,
	"name" varchar(100) NOT NULL,
	"order" integer NOT NULL,
	"season_tag" varchar(100),
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "calendar_seasons" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"calendar_id" varchar(36) NOT NULL,
	"name" varchar(100) NOT NULL,
	"start_day_of_year" integer NOT NULL,
	"description" text,
	"daylight_hours" integer,
	"dawn_dusk_hours" integer,
	"night_hours" integer,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "calendar_weekdays" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"calendar_id" varchar(36) NOT NULL,
	"name" varchar(100) NOT NULL,
	"order" integer NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "calendars" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" text,
	"hours_per_day" integer DEFAULT 24 NOT NULL,
	"minutes_per_hour" integer DEFAULT 60 NOT NULL,
	"daylight_hours" integer DEFAULT 12 NOT NULL,
	"night_hours" integer DEFAULT 10 NOT NULL,
	"dawn_dusk_hours" integer DEFAULT 2 NOT NULL,
	"days_per_year" integer DEFAULT 365 NOT NULL,
	"has_leap_year" boolean DEFAULT false NOT NULL,
	"leap_year_frequency" integer,
	"leap_year_exceptions" text,
	"leap_days_added" integer,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "campaign_archetypes" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"campaign_id" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" text,
	"attributes" jsonb DEFAULT '{}'::jsonb NOT NULL,
	"skills" jsonb DEFAULT '[]'::jsonb NOT NULL,
	"spellcraft_guidance" text,
	"talismanism_guidance" text,
	"faith_guidance" text,
	"psonics_guidance" text,
	"bardic_guidance" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "campaign_characters" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"campaign_player_id" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"player_name" varchar(255),
	"campaign_name" varchar(255),
	"race_id" varchar(36),
	"race" varchar(255),
	"age" integer,
	"base_magic" integer,
	"base_movement" integer,
	"sex" varchar(50),
	"height" integer,
	"weight" integer,
	"skin_color" varchar(100),
	"eye_color" varchar(100),
	"hair_color" varchar(100),
	"deity" varchar(255),
	"defining_marks" text,
	"fame" integer DEFAULT 0 NOT NULL,
	"experience" integer DEFAULT 0 NOT NULL,
	"total_experience" integer DEFAULT 0 NOT NULL,
	"quintessence" integer DEFAULT 0 NOT NULL,
	"total_quintessence" integer DEFAULT 0 NOT NULL,
	"strength" integer DEFAULT 25 NOT NULL,
	"dexterity" integer DEFAULT 25 NOT NULL,
	"constitution" integer DEFAULT 25 NOT NULL,
	"intelligence" integer DEFAULT 25 NOT NULL,
	"wisdom" integer DEFAULT 25 NOT NULL,
	"charisma" integer DEFAULT 25 NOT NULL,
	"skill_allocations" jsonb DEFAULT '{}'::jsonb NOT NULL,
	"personality" text,
	"goals" text,
	"secrets" text,
	"backstory" text,
	"motivations" text,
	"faction" text,
	"relationships" text,
	"attitude_toward_party" text,
	"allies" text,
	"enemies" text,
	"affiliations" text,
	"resources" text,
	"credits_remaining" integer DEFAULT 0 NOT NULL,
	"equipment" jsonb DEFAULT '[]'::jsonb NOT NULL,
	"hp_total" integer,
	"initiative" integer,
	"mana" integer,
	"armor_soak" varchar(100),
	"defense_notes" text,
	"challenge_rating" integer,
	"skill_checkpoint" jsonb,
	"is_initial_setup_locked" boolean DEFAULT false NOT NULL,
	"xp_spent" integer DEFAULT 0 NOT NULL,
	"xp_checkpoint" integer DEFAULT 0 NOT NULL,
	"notes" text,
	"is_setup_complete" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "campaign_currencies" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"campaign_id" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"symbol" varchar(10),
	"credit_value" numeric(10, 4) DEFAULT '1' NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "campaign_players" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"campaign_id" varchar(36) NOT NULL,
	"user_id" varchar(36) NOT NULL,
	"added_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "campaign_store_items" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"campaign_id" varchar(36) NOT NULL,
	"source_type" varchar(20) NOT NULL,
	"source_id" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"item_type" varchar(20) NOT NULL,
	"cost_credits" integer DEFAULT 0 NOT NULL,
	"is_enabled" boolean DEFAULT true NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "campaigns" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"genre" varchar(100),
	"attribute_points" integer DEFAULT 150 NOT NULL,
	"skill_points" integer DEFAULT 50 NOT NULL,
	"max_points_in_skill" integer,
	"points_needed_for_next_tier" integer,
	"max_allowed_in_tier" integer,
	"tier1_enabled" boolean DEFAULT false NOT NULL,
	"tier2_enabled" boolean DEFAULT false NOT NULL,
	"tier3_enabled" boolean DEFAULT false NOT NULL,
	"spellcraft_enabled" boolean DEFAULT false NOT NULL,
	"talismanism_enabled" boolean DEFAULT false NOT NULL,
	"faith_enabled" boolean DEFAULT false NOT NULL,
	"psyonics_enabled" boolean DEFAULT false NOT NULL,
	"bardic_resonances_enabled" boolean DEFAULT false NOT NULL,
	"special_abilities_enabled" boolean DEFAULT false NOT NULL,
	"allowed_races" jsonb DEFAULT '[]'::jsonb NOT NULL,
	"starting_credits" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cultures" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "dungeons" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "economy" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "encounters" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "factions" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "galaxy_eras" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"world_id" varchar(36) NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" text,
	"start_year" integer,
	"end_year" integer,
	"color_hex" varchar(7),
	"order_index" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "galaxy_markers" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"world_id" varchar(36) NOT NULL,
	"era_id" varchar(36),
	"setting_id" varchar(36),
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" text,
	"year" integer,
	"category" varchar(100),
	"visibility" varchar(20) DEFAULT 'canon' NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "galaxy_settings" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"world_id" varchar(36) NOT NULL,
	"era_id" varchar(36),
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" text,
	"start_year" integer,
	"end_year" integer,
	"color_hex" varchar(7),
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "galaxy_worlds" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"description" text,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "geography" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "inventory_armor" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"timeline_tag" varchar(100),
	"cost_credits" integer,
	"area_covered" varchar(100),
	"soak" integer,
	"category" varchar(100),
	"atype" varchar(100),
	"genre_tags" text,
	"weight" integer,
	"encumbrance_penalty" integer,
	"effect" text,
	"narrative_notes" text,
	"rarity" varchar(50),
	"attunement" varchar(255),
	"curse" text,
	"usage_type" varchar(50),
	"max_charges" integer,
	"recharge_window" varchar(50),
	"recharge_notes" text,
	"effect_hooks" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "inventory_artifacts" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"timeline_tag" varchar(100),
	"cost_credits" integer,
	"category" varchar(100),
	"rarity" varchar(50),
	"attunement" varchar(255),
	"genre_tags" text,
	"mechanical_effect" text,
	"curse" text,
	"origin_lore" text,
	"weight" integer,
	"narrative_notes" text,
	"usage_type" varchar(50),
	"max_charges" integer,
	"recharge_window" varchar(50),
	"recharge_notes" text,
	"effect_hooks" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "inventory_companions" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"companion_type" varchar(50),
	"creature_id" varchar(36),
	"creature_name" varchar(255),
	"timeline_tag" varchar(100),
	"cost_credits" integer,
	"genre_tags" text,
	"loyalty" integer,
	"training" text,
	"personality_traits" text,
	"bond" text,
	"mechanical_effect" text,
	"narrative_notes" text,
	"usage_type" varchar(50),
	"max_charges" integer,
	"recharge_window" varchar(50),
	"recharge_notes" text,
	"effect_hooks" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "inventory_items" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"timeline_tag" varchar(100),
	"cost_credits" integer,
	"category" varchar(100),
	"subtype" varchar(100),
	"genre_tags" text,
	"mechanical_effect" text,
	"weight" integer,
	"narrative_notes" text,
	"usage_type" varchar(50),
	"max_charges" integer,
	"recharge_window" varchar(50),
	"recharge_notes" text,
	"effect_hooks" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "inventory_services" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"timeline_tag" varchar(100),
	"cost_credits" integer,
	"category" varchar(100),
	"duration" varchar(255),
	"genre_tags" text,
	"mechanical_effect" text,
	"weight" integer,
	"narrative_notes" text,
	"usage_type" varchar(50),
	"max_charges" integer,
	"recharge_window" varchar(50),
	"recharge_notes" text,
	"effect_hooks" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "inventory_weapons" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"timeline_tag" varchar(100),
	"cost_credits" integer,
	"category" varchar(100),
	"handedness" varchar(50),
	"dtype" varchar(100),
	"range_type" varchar(50),
	"range_text" varchar(100),
	"genre_tags" text,
	"weight" integer,
	"damage" integer,
	"effect" text,
	"narrative_notes" text,
	"rarity" varchar(50),
	"attunement" varchar(255),
	"curse" text,
	"usage_type" varchar(50),
	"max_charges" integer,
	"recharge_window" varchar(50),
	"recharge_notes" text,
	"effect_hooks" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "magic_type_details" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"skill_id" varchar(36) NOT NULL,
	"skill_name" varchar(255),
	"tradition" varchar(100),
	"tier2_path" varchar(100),
	"containers_json" jsonb,
	"modifiers_json" jsonb,
	"mana_cost" integer,
	"casting_time" integer,
	"mastery_level" integer,
	"notes" text,
	"flavor_line" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "npcs" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"alias" varchar(255),
	"importance" varchar(100),
	"role" varchar(255),
	"race" varchar(100),
	"occupation" varchar(255),
	"location" varchar(255),
	"timeline_tag" varchar(100),
	"tags" text,
	"age" varchar(50),
	"gender" varchar(50),
	"description_short" text,
	"appearance" text,
	"strength" integer DEFAULT 25,
	"dexterity" integer DEFAULT 25,
	"constitution" integer DEFAULT 25,
	"intelligence" integer DEFAULT 25,
	"wisdom" integer DEFAULT 25,
	"charisma" integer DEFAULT 25,
	"base_movement" integer DEFAULT 5,
	"hp_total" integer,
	"initiative" integer,
	"armor_soak" varchar(100),
	"defense_notes" text,
	"challenge_rating" integer DEFAULT 1,
	"skill_allocations" jsonb,
	"skill_checkpoint" jsonb,
	"is_initial_setup_locked" boolean DEFAULT false,
	"xp_spent" integer DEFAULT 0,
	"xp_checkpoint" integer DEFAULT 0,
	"personality" text,
	"ideals" text,
	"bonds" text,
	"flaws" text,
	"goals" text,
	"secrets" text,
	"backstory" text,
	"motivations" text,
	"hooks" text,
	"faction" varchar(255),
	"relationships" text,
	"attitude_toward_party" varchar(100),
	"allies" text,
	"enemies" text,
	"affiliations" text,
	"resources" text,
	"notes" text,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "pantheon" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "plot_hooks" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "races" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"world_id" varchar(36),
	"parent_race_id" varchar(36),
	"parent2_race_id" varchar(36),
	"name" varchar(255) NOT NULL,
	"master_label" varchar(255),
	"classifications" jsonb DEFAULT '[]'::jsonb NOT NULL,
	"tagline" text,
	"definition" jsonb,
	"attributes" jsonb,
	"bonus_skills" jsonb,
	"special_abilities" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "roles" (
	"code" varchar(50) PRIMARY KEY NOT NULL,
	"name" varchar(100) NOT NULL,
	"description" varchar(255)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sessions" (
	"id" varchar(40) PRIMARY KEY NOT NULL,
	"user_id" varchar(36) NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"expires_at" timestamp with time zone NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "settlements" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "skills" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"type" varchar(50) NOT NULL,
	"tier" integer,
	"primary_attribute" varchar(10) NOT NULL,
	"secondary_attribute" varchar(10) NOT NULL,
	"definition" text,
	"parent_id" varchar(36),
	"parent2_id" varchar(36),
	"parent3_id" varchar(36),
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "special_ability_details" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"skill_id" varchar(36) NOT NULL,
	"ability_type" varchar(100),
	"scaling_method" varchar(100),
	"prerequisites" text,
	"scaling_details" text,
	"stage1_tag" varchar(255),
	"stage1_desc" text,
	"stage1_points" varchar(50),
	"stage2_tag" varchar(255),
	"stage2_desc" text,
	"stage2_points" varchar(50),
	"stage3_tag" varchar(255),
	"stage3_desc" text,
	"stage4_tag" varchar(255),
	"stage4_desc" text,
	"final_tag" varchar(255),
	"final_desc" text,
	"add1_tag" varchar(255),
	"add1_desc" text,
	"add2_tag" varchar(255),
	"add2_desc" text,
	"add3_tag" varchar(255),
	"add3_desc" text,
	"add4_tag" varchar(255),
	"add4_desc" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "timeline" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"created_by" varchar(36) NOT NULL,
	"name" varchar(255) NOT NULL,
	"tagline" text,
	"data" jsonb,
	"is_free" boolean DEFAULT true NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_preferences" (
	"user_id" varchar(36) PRIMARY KEY NOT NULL,
	"theme" varchar(50) DEFAULT 'void',
	"background_image" varchar(255) DEFAULT 'nebula.png',
	"gear_image" varchar(255),
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_roles" (
	"user_id" varchar(36) NOT NULL,
	"role_code" varchar(50) NOT NULL,
	"granted_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_roles_user_id_role_code_pk" PRIMARY KEY("user_id","role_code")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "users" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"username" varchar(50) NOT NULL,
	"email" varchar(255),
	"password_hash" varchar(255) NOT NULL,
	"is_active" boolean DEFAULT true NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "users_username_unique" UNIQUE("username"),
	CONSTRAINT "users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "calendar_astronomical_events" ADD CONSTRAINT "calendar_astronomical_events_calendar_id_calendars_id_fk" FOREIGN KEY ("calendar_id") REFERENCES "public"."calendars"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "calendar_festivals" ADD CONSTRAINT "calendar_festivals_calendar_id_calendars_id_fk" FOREIGN KEY ("calendar_id") REFERENCES "public"."calendars"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "calendar_month_weeks" ADD CONSTRAINT "calendar_month_weeks_month_id_calendar_months_id_fk" FOREIGN KEY ("month_id") REFERENCES "public"."calendar_months"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "calendar_months" ADD CONSTRAINT "calendar_months_calendar_id_calendars_id_fk" FOREIGN KEY ("calendar_id") REFERENCES "public"."calendars"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "calendar_seasons" ADD CONSTRAINT "calendar_seasons_calendar_id_calendars_id_fk" FOREIGN KEY ("calendar_id") REFERENCES "public"."calendars"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "calendar_weekdays" ADD CONSTRAINT "calendar_weekdays_calendar_id_calendars_id_fk" FOREIGN KEY ("calendar_id") REFERENCES "public"."calendars"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "calendars" ADD CONSTRAINT "calendars_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "campaign_archetypes" ADD CONSTRAINT "campaign_archetypes_campaign_id_campaigns_id_fk" FOREIGN KEY ("campaign_id") REFERENCES "public"."campaigns"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "campaign_characters" ADD CONSTRAINT "campaign_characters_campaign_player_id_campaign_players_id_fk" FOREIGN KEY ("campaign_player_id") REFERENCES "public"."campaign_players"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "campaign_characters" ADD CONSTRAINT "campaign_characters_race_id_races_id_fk" FOREIGN KEY ("race_id") REFERENCES "public"."races"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "campaign_currencies" ADD CONSTRAINT "campaign_currencies_campaign_id_campaigns_id_fk" FOREIGN KEY ("campaign_id") REFERENCES "public"."campaigns"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "campaign_players" ADD CONSTRAINT "campaign_players_campaign_id_campaigns_id_fk" FOREIGN KEY ("campaign_id") REFERENCES "public"."campaigns"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "campaign_players" ADD CONSTRAINT "campaign_players_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "campaign_store_items" ADD CONSTRAINT "campaign_store_items_campaign_id_campaigns_id_fk" FOREIGN KEY ("campaign_id") REFERENCES "public"."campaigns"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "campaigns" ADD CONSTRAINT "campaigns_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "cultures" ADD CONSTRAINT "cultures_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "dungeons" ADD CONSTRAINT "dungeons_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "economy" ADD CONSTRAINT "economy_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "encounters" ADD CONSTRAINT "encounters_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "factions" ADD CONSTRAINT "factions_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_eras" ADD CONSTRAINT "galaxy_eras_world_id_galaxy_worlds_id_fk" FOREIGN KEY ("world_id") REFERENCES "public"."galaxy_worlds"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_eras" ADD CONSTRAINT "galaxy_eras_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_markers" ADD CONSTRAINT "galaxy_markers_world_id_galaxy_worlds_id_fk" FOREIGN KEY ("world_id") REFERENCES "public"."galaxy_worlds"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_markers" ADD CONSTRAINT "galaxy_markers_era_id_galaxy_eras_id_fk" FOREIGN KEY ("era_id") REFERENCES "public"."galaxy_eras"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_markers" ADD CONSTRAINT "galaxy_markers_setting_id_galaxy_settings_id_fk" FOREIGN KEY ("setting_id") REFERENCES "public"."galaxy_settings"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_markers" ADD CONSTRAINT "galaxy_markers_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_settings" ADD CONSTRAINT "galaxy_settings_world_id_galaxy_worlds_id_fk" FOREIGN KEY ("world_id") REFERENCES "public"."galaxy_worlds"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_settings" ADD CONSTRAINT "galaxy_settings_era_id_galaxy_eras_id_fk" FOREIGN KEY ("era_id") REFERENCES "public"."galaxy_eras"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_settings" ADD CONSTRAINT "galaxy_settings_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "galaxy_worlds" ADD CONSTRAINT "galaxy_worlds_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "geography" ADD CONSTRAINT "geography_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "inventory_armor" ADD CONSTRAINT "inventory_armor_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "inventory_artifacts" ADD CONSTRAINT "inventory_artifacts_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "inventory_companions" ADD CONSTRAINT "inventory_companions_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "inventory_companions" ADD CONSTRAINT "inventory_companions_creature_id_races_id_fk" FOREIGN KEY ("creature_id") REFERENCES "public"."races"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "inventory_items" ADD CONSTRAINT "inventory_items_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "inventory_services" ADD CONSTRAINT "inventory_services_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "inventory_weapons" ADD CONSTRAINT "inventory_weapons_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "magic_type_details" ADD CONSTRAINT "magic_type_details_skill_id_skills_id_fk" FOREIGN KEY ("skill_id") REFERENCES "public"."skills"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "npcs" ADD CONSTRAINT "npcs_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "pantheon" ADD CONSTRAINT "pantheon_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "plot_hooks" ADD CONSTRAINT "plot_hooks_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "races" ADD CONSTRAINT "races_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "races" ADD CONSTRAINT "races_world_id_galaxy_worlds_id_fk" FOREIGN KEY ("world_id") REFERENCES "public"."galaxy_worlds"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "races" ADD CONSTRAINT "races_parent_race_id_races_id_fk" FOREIGN KEY ("parent_race_id") REFERENCES "public"."races"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "races" ADD CONSTRAINT "races_parent2_race_id_races_id_fk" FOREIGN KEY ("parent2_race_id") REFERENCES "public"."races"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "sessions" ADD CONSTRAINT "sessions_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "settlements" ADD CONSTRAINT "settlements_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "skills" ADD CONSTRAINT "skills_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "skills" ADD CONSTRAINT "skills_parent_id_skills_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."skills"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "skills" ADD CONSTRAINT "skills_parent2_id_skills_id_fk" FOREIGN KEY ("parent2_id") REFERENCES "public"."skills"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "skills" ADD CONSTRAINT "skills_parent3_id_skills_id_fk" FOREIGN KEY ("parent3_id") REFERENCES "public"."skills"("id") ON DELETE set null ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "special_ability_details" ADD CONSTRAINT "special_ability_details_skill_id_skills_id_fk" FOREIGN KEY ("skill_id") REFERENCES "public"."skills"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "timeline" ADD CONSTRAINT "timeline_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "user_preferences" ADD CONSTRAINT "user_preferences_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "user_roles" ADD CONSTRAINT "user_roles_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
DO $$ BEGIN ALTER TABLE "user_roles" ADD CONSTRAINT "user_roles_role_code_roles_code_fk" FOREIGN KEY ("role_code") REFERENCES "public"."roles"("code") ON DELETE cascade ON UPDATE no action; EXCEPTION WHEN duplicate_object THEN NULL; END $$;--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_calendar_astronomical_events_calendar_id" ON "calendar_astronomical_events" USING btree ("calendar_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_calendar_festivals_calendar_id" ON "calendar_festivals" USING btree ("calendar_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_calendar_month_weeks_month_id" ON "calendar_month_weeks" USING btree ("month_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_calendar_months_calendar_id" ON "calendar_months" USING btree ("calendar_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_calendar_seasons_calendar_id" ON "calendar_seasons" USING btree ("calendar_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_calendar_weekdays_calendar_id" ON "calendar_weekdays" USING btree ("calendar_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_calendars_created_by" ON "calendars" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_campaign_archetypes_campaign_id" ON "campaign_archetypes" USING btree ("campaign_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_campaign_characters_player_id" ON "campaign_characters" USING btree ("campaign_player_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_campaign_currencies_campaign_id" ON "campaign_currencies" USING btree ("campaign_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_campaign_players_campaign_id" ON "campaign_players" USING btree ("campaign_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_campaign_players_user_id" ON "campaign_players" USING btree ("user_id");--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "idx_campaign_players_campaign_user_unique" ON "campaign_players" USING btree ("campaign_id","user_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_campaign_store_items_campaign_id" ON "campaign_store_items" USING btree ("campaign_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_campaign_store_items_source" ON "campaign_store_items" USING btree ("source_type","source_id");--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "idx_campaign_store_items_unique" ON "campaign_store_items" USING btree ("campaign_id","source_type","source_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_campaigns_created_by" ON "campaigns" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_cultures_created_by" ON "cultures" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_cultures_name" ON "cultures" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_dungeons_created_by" ON "dungeons" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_dungeons_name" ON "dungeons" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_economy_created_by" ON "economy" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_economy_name" ON "economy" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_encounters_created_by" ON "encounters" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_encounters_name" ON "encounters" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_factions_created_by" ON "factions" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_factions_name" ON "factions" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_eras_world_id" ON "galaxy_eras" USING btree ("world_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_eras_world_order" ON "galaxy_eras" USING btree ("world_id","order_index");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_eras_created_by" ON "galaxy_eras" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_markers_world_year" ON "galaxy_markers" USING btree ("world_id","year");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_markers_era_id" ON "galaxy_markers" USING btree ("era_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_markers_setting_id" ON "galaxy_markers" USING btree ("setting_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_markers_created_by" ON "galaxy_markers" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_settings_world_id" ON "galaxy_settings" USING btree ("world_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_settings_era_id" ON "galaxy_settings" USING btree ("era_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_settings_created_by" ON "galaxy_settings" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_worlds_created_by" ON "galaxy_worlds" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_galaxy_worlds_name" ON "galaxy_worlds" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_geography_created_by" ON "geography" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_geography_name" ON "geography" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_inventory_armor_created_by" ON "inventory_armor" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_inventory_artifacts_created_by" ON "inventory_artifacts" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_inventory_companions_created_by" ON "inventory_companions" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_inventory_companions_creature_id" ON "inventory_companions" USING btree ("creature_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_inventory_items_created_by" ON "inventory_items" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_inventory_services_created_by" ON "inventory_services" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_inventory_weapons_created_by" ON "inventory_weapons" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_magic_type_details_skill_id" ON "magic_type_details" USING btree ("skill_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_npcs_created_by" ON "npcs" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_npcs_race" ON "npcs" USING btree ("race");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_npcs_challenge_rating" ON "npcs" USING btree ("challenge_rating");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_pantheon_created_by" ON "pantheon" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_pantheon_name" ON "pantheon" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_plot_hooks_created_by" ON "plot_hooks" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_plot_hooks_name" ON "plot_hooks" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_races_created_by" ON "races" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_races_world_id" ON "races" USING btree ("world_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_races_parent_race_id" ON "races" USING btree ("parent_race_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_races_parent2_race_id" ON "races" USING btree ("parent2_race_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_sessions_user" ON "sessions" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_settlements_created_by" ON "settlements" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_settlements_name" ON "settlements" USING btree ("name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_skills_created_by" ON "skills" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_skills_type" ON "skills" USING btree ("type");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_skills_tier" ON "skills" USING btree ("tier");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_special_ability_details_skill_id" ON "special_ability_details" USING btree ("skill_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_timeline_created_by" ON "timeline" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_timeline_name" ON "timeline" USING btree ("name");
