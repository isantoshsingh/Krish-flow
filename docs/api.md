## Dashboard

- `GET /dashboard`
  - Displays the main dashboard.

## Reports

- `GET /reports`
  - Displays the reports page.
- `GET /reports/export`
  - Exports reports based on specified criteria.

## People

- `GET /people`
  - Lists all people.
- `GET /people/:id`
  - Shows details for a specific person.
- `GET /people/new`
  - Displays the form for creating a new person.
- `POST /people`
  - Creates a new person.
- `GET /people/:id/edit`
  - Displays the form for editing a person.
- `PATCH/PUT /people/:id`
  - Updates a person.
- `DELETE /people/:id`
  - Deletes a person.
- `GET /people/:id/lands_owned`
  - Lists lands owned by a specific person.
- `GET /people/:id/lands_farmed`
  - Lists lands farmed by a specific person.

## Lands

- `GET /lands`
  - Lists all lands.
- `GET /lands/:id`
  - Shows details for a specific land.
- `GET /lands/new`
  - Displays the form for creating a new land.
- `POST /lands`
  - Creates a new land.
- `GET /lands/:id/edit`
  - Displays the form for editing a land.
- `PATCH/PUT /lands/:id`
  - Updates a land.
- `DELETE /lands/:id`
  - Deletes a land.

### Nested Lease Snapshots (under Lands)

- `GET /lands/:land_id/lease_snapshots/new`
  - Displays the form for creating a new lease snapshot for a specific land.
- `POST /lands/:land_id/lease_snapshots`
  - Creates a new lease snapshot for a specific land.
- `GET /lands/:land_id/lease_snapshots/:id/edit`
  - Displays the form for editing a lease snapshot for a specific land.
- `PATCH/PUT /lands/:land_id/lease_snapshots/:id`
  - Updates a lease snapshot for a specific land.
- `DELETE /lands/:land_id/lease_snapshots/:id`
  - Deletes a lease snapshot for a specific land.

#### Nested Payments (under Lease Snapshots)

- `GET /lands/:land_id/lease_snapshots/:lease_snapshot_id/payments/new`
  - Displays the form for creating a new payment for a specific lease snapshot.
- `POST /lands/:land_id/lease_snapshots/:lease_snapshot_id/payments`
  - Creates a new payment for a specific lease snapshot.
- `GET /lands/:land_id/lease_snapshots/:lease_snapshot_id/payments/:id/edit`
  - Displays the form for editing a payment for a specific lease snapshot.
- `PATCH/PUT /lands/:land_id/lease_snapshots/:lease_snapshot_id/payments/:id`
  - Updates a payment for a specific lease snapshot.
- `DELETE /lands/:land_id/lease_snapshots/:lease_snapshot_id/payments/:id`
  - Deletes a payment for a specific lease snapshot.

## Lease Snapshots

- `GET /lease_snapshots`
  - Lists all lease snapshots.
- `GET /lease_snapshots/:id`
  - Shows details for a specific lease snapshot.

### Nested Payments (under Lease Snapshots)

- `GET /lease_snapshots/:lease_snapshot_id/payments`
  - Lists all payments for a specific lease snapshot.
- `GET /lease_snapshots/:lease_snapshot_id/payments/:id`
  - Shows details for a specific payment.