json.extract! lease_snapshot, :id, :land_id, :farmer_id, :financial_year, :investment_amount, :expected_return, :start_date, :end_date, :status, :created_at, :updated_at
json.url lease_snapshot_url(lease_snapshot, format: :json)
