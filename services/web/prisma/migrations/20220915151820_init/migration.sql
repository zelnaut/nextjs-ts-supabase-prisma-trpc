-- Extensions
create extension if not exists "uuid-ossp";

-- CreateTable
CREATE TABLE "jobs" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "title" TEXT,
    "description" TEXT,
    "type" TEXT,
    "pay" SMALLINT,
    "education" TEXT,
    "experience" TEXT,
    "location" TEXT,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "benefits" TEXT,

    CONSTRAINT "jobs_pkey" PRIMARY KEY ("id")
);
