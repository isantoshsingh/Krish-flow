# 🌾 KrishFlow

**KrishFlow** is a Ruby on Rails 8 application built to simplify agricultural land leasing and returns tracking.
It helps you manage lands leased from landowners and subleased to farmers, record yearly investments, partial payments, and monitor returns – all with historical context.

---

## 🚀 Features

### 🧑‍🌾 Person Management
- Store details of individuals involved in the leasing process.
- Each person can be a **landowner**, **farmer**, or **both**, depending on their role in a lease.
- Person details:
  - Name
  - Phone number
  - Village
  - District

### 🌱 Land Management
- Add leased land with:
  - Size value
  - Unit (`bigha` or `biswa`)
  - Location
- Automatic conversion: `1 bigha = 20 biswas`
- All land sizes stored consistently in `biswas`
- Associate each land with a landowner (via `Person` model)

### 💰 Return & Payment Tracking
- Track expected returns from each land annually (e.g., ₹17K–₹20K per ₹1L investment)
- Log partial payments received from farmers
- Track outstanding returns automatically

### 📅 Financial Year-Based Lease Snapshots
- Capture each land's lease conditions on a **per-financial-year** basis (e.g., `2024-25`, `2025-26`)
- Investment changes can only happen at the start of a new financial year
- Retain complete lease history per land and year

### 📊 Dashboard & Reports
- Overview of:
  - Total lands
  - Total investment
  - Expected vs. received returns
- Export reports by land, farmer, or year (CSV/PDF)

---

## 🗂️ Data Model Overview

For a detailed explanation of the data models, see [docs/models.md](docs/models.md).

## 🔗 API Endpoints

For a comprehensive list of API endpoints, see [docs/api.md](docs/api.md).

## 🗄️ Database Schema

For a detailed overview of the database schema, see [docs/database_schema.md](docs/database_schema.md).


```yaml
Person:
  name: string
  phone: string
  village: string
  district: string

Land:
  location: string
  size_value: decimal
  size_unit: string        # 'bigha' or 'biswa'
  size_in_biswas: decimal
  landowner_id: references :person

LeaseSnapshot:
  land_id: references
  farmer_id: references :person
  financial_year: string
  investment_amount: decimal
  expected_return: decimal
  start_date: date
  end_date: date
  status: string

Payment:
  lease_snapshot_id: references
  amount: decimal
  payment_date: date
  mode: string


---

## 🛠️ Tech Stack

For a detailed breakdown of the technologies used, see [docs/tech_stack.md](docs/tech_stack.md).


- **Backend**: Ruby on Rails 8
- **Database**: PostgreSQL
- **Frontend**: Bootstrap + Hotwire (Turbo, Stimulus) or React (optional)
- **Authentication**: Devise
- **Exporting**: `prawn` for PDFs, `csv`/`caxlsx` for data exports

---

## 📚 Documentation & Guides

- [User Manual](docs/user_guides/user_manual.md): A comprehensive guide for end-users and administrators on how to use KrishFlow.

## 🏁 Getting Started

```bash
# Clone the repository
git clone https://github.com/isantoshsingh/krishflow.git
cd krishflow

# Install dependencies
bundle install

# Setup the database
rails db:create db:migrate db:seed

*Database migrations have been created.*

# Start the Rails server
rails server
