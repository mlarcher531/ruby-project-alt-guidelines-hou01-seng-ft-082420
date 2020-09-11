class CreateMixers < ActiveRecord::Migration[5.2]
  def change
    create_table :mixers do |t|
      t.string :name
  end
  end
end
