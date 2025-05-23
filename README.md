

# 🌾 KrishFlow

**KrishFlow** is a Ruby on Rails 8 application designed to simplify the management of agricultural land leasing and financial returns.  
It helps you track land leased from owners and subleased to farmers, monitor yearly investments, partial payments, and expected returns.

---

## 🚀 Features

### 👨‍🌾 Land & Farmer Management
- Add leased land with size (in bighas), location, and investment amount.
- Link each land to a farmer who cultivates it.

### 💰 Return & Payment Tracking
- Track expected return per land annually (₹17K–₹20K per ₹1L investment).
- Record partial payments received from farmers throughout the financial year.
- Automatically calculate and show outstanding returns.

### 📅 Financial Year-Based Lease Snapshots
- Track all lease agreements by **financial year** (e.g., `2024-25`, `2025-26`).
- Investments can be increased or reduced only at the start of a new financial year.
- Maintain historical data for each lease year – no overwriting.

### 📊 Dashboard & Reports
- Summarize key metrics:
  - Total lands
  - Total investment
  - Expected return
  - Received payments
  - Pending returns
- Export reports by land, farmer, or financial year (CSV/PDF).

---

## 🗂️ Data Model Overview

### `Land`
- `location`, `size_in_bigha`

### `Farmer`
- `name`, `contact_info`

### `LeaseSnapshot`
- `land_id`, `farmer_id`, `financial_year`, `investment_amount`, `expected_return`, `start_date`, `end_date`, `status`

### `Payment`
- `lease_snapshot_id`, `amount`, `payment_date`, `mode`

---

## 🛠️ Tech Stack

- **Backend**: Ruby on Rails 8
- **Database**: PostgreSQL
- **Frontend**: Hotwire (Turbo, Stimulus) or React (optional)
- **Authentication**: Devise
- **Exporting**: `prawn` for PDFs, `csv`/`axlsx` for data exports

---

## 🏁 Getting Started

```bash
# Clone the repository
git clone https://github.com/isantoshsingh/krishflow.git
cd krishflow

# Install dependencies
bundle install

# Setup the database
rails db:create db:migrate db:seed

# Start the Rails server
rails server
