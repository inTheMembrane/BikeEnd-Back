-- Deploy bikeend-back:other_tables to pg
BEGIN;

CREATE TABLE IF NOT EXISTS "favorite" (
    "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    "departure_date_time" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "from_name" TEXT NOT NULL,
    "from_id" TEXT NOT NULL,
    "to_name" TEXT NOT NULL,
    "to_id" TEXT NOT NULL,
    "comment" TEXT,
    "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "filter" (
    "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    "start_point" TEXT NOT NULL,
    "end_point" TEXT,
    "max_journey_time" INTEGER,
    "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "favorite"
    ADD COLUMN "user_id" int REFERENCES "user"("id") ON DELETE CASCADE;
-- user FAVORS favorite

ALTER TABLE "filter"
    ADD COLUMN "user_id" int REFERENCES "user"("id") ON DELETE CASCADE;
-- user SAVES filter

COMMIT;
