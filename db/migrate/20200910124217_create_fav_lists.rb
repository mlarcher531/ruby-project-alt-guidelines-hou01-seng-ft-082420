class CreateFavLists < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_lists do |t|
      t.string  :name
      t.integer :drink_id1
      t.integer :drink_id2
      t.integer :drink_id3
      t.integer :drink_id4
      t.integer :drink_id5
  end
end
end
