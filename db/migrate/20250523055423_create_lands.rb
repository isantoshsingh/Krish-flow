class CreateLands < ActiveRecord::Migration[8.0]
  def change
    create_table :lands do |t|
      t.string :location, null: false
      t.decimal :size_value, precision: 10, scale: 2, null: false
      t.string :size_unit, null: false
      t.decimal :size_in_biswas, precision: 10, scale: 2, null: false
      t.references :landowner, null: false, foreign_key: { to_table: :people }
      
      t.timestamps
    end
    
    add_index :lands, :location
    add_index :lands, :landowner_id
  end
end
