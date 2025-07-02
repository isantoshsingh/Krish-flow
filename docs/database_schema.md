# Database Schema

This document outlines the database schema for Krish Flow, generated from `db/schema.rb`.

## Tables

### `lands`

- `location` (string)
- `size_value` (decimal)
- `size_unit` (string)
- `size_in_biswas` (decimal)
- `landowner_id` (bigint)
- `created_at` (datetime)
- `updated_at` (datetime)

### `lease_snapshots`

- `land_id` (bigint, null: false)
- `farmer_id` (bigint)
- `financial_year` (string)
- `investment_amount` (decimal)
- `expected_return` (decimal)
- `start_date` (date)
- `end_date` (date)
- `status` (string)
- `created_at` (datetime)
- `updated_at` (datetime)

### `payments`

- `lease_snapshot_id` (bigint, null: false)
- `amount` (decimal)
- `payment_date` (date)
- `mode` (string)
- `created_at` (datetime)
- `updated_at` (datetime)

### `people`

- `name` (string)
- `phone` (string)
- `village` (string)
- `district` (string)
- `created_at` (datetime)
- `updated_at` (datetime)

## Foreign Keys

- `lands` table has a foreign key `landowner_id` referencing `people` table.
- `lease_snapshots` table has a foreign key `land_id` referencing `lands` table.
- `lease_snapshots` table has a foreign key `farmer_id` referencing `people` table.
- `payments` table has a foreign key `lease_snapshot_id` referencing `lease_snapshots` table.
