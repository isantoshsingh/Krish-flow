class CreateLeaseSnapshots < ActiveRecord::Migration[8.0]
  def change
    create_table :lease_snapshots do |t|
      t.references :land, null: false, foreign_key: true
      t.references :farmer, null: false, foreign_key: { to_table: :people }
      t.string :financial_year, null: false
      t.decimal :investment_amount, precision: 12, scale: 2, null: false
      t.decimal :expected_return, precision: 12, scale: 2, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, null: false, default: 'active'
      
      t.timestamps
    end
    
    add_index :lease_snapshots, [:land_id, :financial_year], unique: true
    add_index :lease_snapshots, :farmer_id
    add_index :lease_snapshots, :financial_year
    add_index :lease_snapshots, :status
  end
end
