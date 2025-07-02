# KrishFlow User Manual

This manual provides a comprehensive guide for end-users and administrators on how to effectively use the KrishFlow application.

## 1. Introduction to KrishFlow

KrishFlow is a Ruby on Rails application designed to simplify agricultural land leasing and returns tracking. It helps you manage lands leased from landowners and subleased to farmers, record yearly investments, partial payments, and monitor returns—all with historical context.

## 2. Getting Started

To access KrishFlow, open your web browser and navigate to the application's URL (e.g., `http://localhost:3000` if running locally).

The main navigation bar provides access to different sections of the application:
- **Dashboard**: Overview of key metrics.
- **People**: Manage individuals involved in leasing.
- **Lands**: Manage leased land details.
- **Lease Snapshots**: Track lease conditions per financial year.
- **Payments**: Record and view payments.
- **Reports**: Generate various reports.

## 3. Dashboard Overview

The Dashboard provides a quick overview of your agricultural leasing operations. Here you can see:
- Total number of lands managed.
- Total investment across all active leases.
- Expected returns versus actual received returns.
- Quick links to frequently used sections.

## 4. People Management

The "People" section allows you to manage all individuals involved in your leasing process, including landowners and farmers.

### Adding a New Person

1.  Navigate to the "People" section.
2.  Click on the "New Person" button.
3.  Fill in the following details:
    *   **Name**: The full name of the individual.
    *   **Phone Number**: Their contact phone number (must be unique).
    *   **Village**: The village where they reside.
    *   **District**: The district where they reside.
4.  Click "Create Person".

### Managing People

From the People list, you can:
- **View Details**: Click on a person's name to see their full profile, including lands they own or farm.
- **Edit**: Click the "Edit" button next to a person's name to modify their details.
- **Delete**: Click the "Delete" button to remove a person from the system.
- **Lands Owned**: View a list of lands owned by a specific person.
- **Lands Farmed**: View a list of lands farmed by a specific person.

A person can be a **landowner**, a **farmer**, or **both**, depending on their association with lands and lease snapshots.

## 5. Land Management

The "Lands" section is where you manage the details of all agricultural lands you have leased.

### Adding a New Land

1.  Navigate to the "Lands" section.
2.  Click on the "New Land" button.
3.  Fill in the following details:
    *   **Location**: A descriptive location of the land (e.g., "North field near river", "Plot 3, Village X").
    *   **Size Value**: The numerical value of the land's size.
    *   **Size Unit**: Select either "bigha" or "biswa". (Note: 1 bigha = 20 biswas. All land sizes are internally converted and stored in biswas for consistency).
    *   **Landowner**: Select the person who owns this land from the dropdown list.
4.  Click "Create Land".

### Managing Lands

From the Lands list, you can:
- **View Details**: Click on a land's location to see its full profile, including associated lease snapshots.
- **Edit**: Modify land details.
- **Delete**: Remove a land from the system.

## 6. Lease Snapshot Management

Lease snapshots capture the specific conditions of a land lease for a given financial year. This allows for historical tracking of lease agreements.

### Creating a New Lease Snapshot

Lease snapshots are created for a specific land.
1.  Navigate to the "Lands" section and select the land for which you want to create a lease snapshot.
2.  On the land's detail page, find the "Lease Snapshots" section and click "New Lease Snapshot".
3.  Fill in the following details:
    *   **Financial Year**: The financial year for this lease (e.g., "2024-25").
    *   **Farmer**: Select the person who is farming this land for this financial year.
    *   **Investment Amount**: The total investment made for this lease in this financial year.
    *   **Expected Return**: The expected return from this lease for this financial year.
    *   **Start Date**: The start date of the lease for this financial year.
    *   **End Date**: The end date of the lease for this financial year.
    *   **Status**: Select the current status (e.g., "active", "completed", "cancelled").
4.  Click "Create Lease Snapshot".

### Managing Lease Snapshots

From the Lease Snapshots list (accessible from a land's detail page or the main "Lease Snapshots" menu), you can:
- **View Details**: See all details of a lease snapshot, including associated payments.
- **Edit**: Modify the lease conditions for a specific financial year.
- **Delete**: Remove a lease snapshot.

## 7. Payment Tracking

The "Payments" section allows you to record and track individual payments made by farmers against their lease snapshots.

### Recording a New Payment

Payments are associated with a specific lease snapshot.
1.  Navigate to the "Lease Snapshots" section and select the lease snapshot for which you want to record a payment.
2.  On the lease snapshot's detail page, find the "Payments" section and click "New Payment".
3.  Fill in the following details:
    *   **Amount**: The amount of the payment received.
    *   **Payment Date**: The date the payment was received.
    *   **Mode**: The method of payment (e.g., "Cash", "UPI", "Bank Transfer").
4.  Click "Create Payment".

### Viewing Payments

- You can view all payments for a specific lease snapshot from its detail page.
- The lease snapshot detail page also shows the total payments received, the outstanding amount, and the payment percentage.

## 8. Reports and Exports

The "Reports" section allows you to generate various reports to analyze your leasing operations.

1.  Navigate to the "Reports" section.
2.  You can typically filter reports by:
    *   **Land**: Generate reports for a specific land.
    *   **Farmer**: Generate reports for a specific farmer.
    *   **Financial Year**: Generate reports for a particular financial year.
3.  After applying filters, you can usually:
    *   **View Report**: See the report directly on the screen.
    *   **Export to CSV**: Download the report as a Comma Separated Values file, which can be opened in spreadsheet software.
    *   **Export to PDF**: Download the report as a Portable Document Format file for easy printing and sharing.
