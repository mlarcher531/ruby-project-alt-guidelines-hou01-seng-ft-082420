class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :liquor_id
      t.integer :liquor_id2
      t.integer :mixer_id
      t.integer :mixer_id2
  end
end
end
