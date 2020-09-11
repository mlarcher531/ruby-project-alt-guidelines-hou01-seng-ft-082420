class CreateSecondaryMixers < ActiveRecord::Migration[5.2]
  def change
    create_table :secondary_mixers do |t|
      t.string :name
  end
end
end
