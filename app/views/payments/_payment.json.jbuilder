json.extract! payment, :id, :lease_snapshot_id, :amount, :payment_date, :mode, :created_at, :updated_at
json.url payment_url(payment, format: :json)
