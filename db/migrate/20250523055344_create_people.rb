class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :village, null: false
      t.string :district, null: false

      t.timestamps
    end

    add_index :people, [:village, :district]
  end
end
