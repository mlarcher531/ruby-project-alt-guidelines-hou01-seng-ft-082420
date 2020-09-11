class CreateSecondaryLiquors < ActiveRecord::Migration[5.2]
    def change
      create_table :secondary_liquors do |t|
          t.string :name
      end
  end
end
