
## LeaseSnapshot

The `LeaseSnapshot` model captures the conditions of a land lease for a specific financial year.

### Attributes

- `land_id` (references): Foreign key linking to the `Land` model.
- `farmer_id` (references): Foreign key linking to the `Person` model, representing the farmer leasing the land.
- `financial_year` (string): The financial year for which the snapshot is taken (e.g., "2024-25").
- `investment_amount` (decimal): The total investment made for this lease in the given financial year.
- `expected_return` (decimal): The expected return from this lease for the given financial year.
- `start_date` (date): The start date of the lease for this financial year.
- `end_date` (date): The end date of the lease for this financial year.
- `status` (string): The status of the lease snapshot (e.g., 'active', 'completed', 'cancelled').

### Associations

- `land`: Belongs to a `Land`.
- `farmer`: Belongs to a `Person` (the farmer).
- `payments`: Has many `Payment` records associated with this lease snapshot.

### Methods

- `total_payments`: Calculates the sum of all payments received for this lease snapshot.
- `outstanding_amount`: Calculates the remaining amount to be paid (`expected_return - total_payments`).
- `payment_percentage`: Calculates the percentage of the expected return that has been paid.
- `is_fully_paid?`: Returns `true` if the outstanding amount is zero or less.
- `profit`: Calculates the profit from the lease (`expected_return - investment_amount`).
- `profit_percentage`: Calculates the profit as a percentage of the investment amount.

## Payment

The `Payment` model records individual payments made against a `LeaseSnapshot`.

### Attributes

- `lease_snapshot_id` (references): Foreign key linking to the `LeaseSnapshot` model.
- `amount` (decimal): The amount of the payment.
- `payment_date` (date): The date the payment was made.
- `mode` (string): The mode of payment (e.g., 'cash', 'upi', 'bank_transfer').

### Associations

- `lease_snapshot`: Belongs to a `LeaseSnapshot`.

### Methods

- `mode_display`: Returns a humanized version of the payment mode (e.g., "Cash", "Upi").
