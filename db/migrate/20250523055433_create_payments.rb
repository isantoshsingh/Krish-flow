class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :lease_snapshot, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.date :payment_date, null: false
      t.string :mode, null: false
      t.text :notes
      
      t.timestamps
    end
    
    add_index :payments, :lease_snapshot_id
    add_index :payments, :payment_date
    add_index :payments, :mode
  end
end
