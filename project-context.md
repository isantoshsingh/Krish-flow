# Project Context: Agricultural Land Leasing Management Application

## Overview
This web application is designed to manage agricultural land leasing and track yearly returns. I lease land from owners (typically at ₹1L per bigha) and sublease it to farmers, who pay an annual return of ₹17K–₹20K in partial payments. The app operates on a financial year basis (e.g., 2024–25), isolates data per year, and supports tracking, reporting, and future enhancements.

## Core Features
1. **Track Leased Lands**
   - Attributes: Size, location, investment, expected return, associated farmer.
   - Track all leased lands for each financial year.

2. **Record Partial Payments**
   - Log payments from farmers for each leased land.
   - Display total received payments vs. outstanding balance per land.

3. **Financial Year-Based Model**
   - Leases and investments are tracked annually (e.g., 2024–25, 2025–26).
   - Changes (e.g., adding/removing land, adjusting investment) are allowed only at the start of a new financial year.

4. **Historical Data**
   - Maintain records for each financial year without overwriting previous data.

5. **Dashboard Summaries**
   - Display:
     - Total lands leased.
     - Total investment.
     - Expected return.
     - Received payments.
     - Outstanding balance.
   - Summaries are specific to the current financial year.

6. **Export Reports**
   - Generate reports filtered by:
     - Land (across years).
     - Farmer (across years).
     - Financial year.

## Future Enhancements
1. **Alerts for Due Payments**
   - Notify users when payments are overdue.

2. **Expenses per Land**
   - Track expenses associated with each land per financial year.

3. **Tag High/Low-Performing Lands**
   - Identify and tag lands based on performance (e.g., payment consistency).

## Suggested Tech Stack
- **Frontend**: Bootstrap + Hotwire (Turbo, Stimulus).
- **Backend**: Rails 8.
- **Database**: PostgreSQL (for complex queries and data integrity).

## Data Model
The application uses a `LeaseSnapshot` model to version leases by financial year, ensuring data isolation and historical tracking.
