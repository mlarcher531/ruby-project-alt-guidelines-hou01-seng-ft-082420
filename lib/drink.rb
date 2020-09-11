class Drink < ActiveRecord::Base
    belongs_to :liquor
    belongs_to :secondary_liquor
    belongs_to :mixer
    belongs_to :secondary_mixer
    belongs_to :fav_list
    has_many :users, through: :fav_list

   def get_drink_by_main_liquor
   end

   def get_drink_by_mixer
   end

   def get_drink_by_sec_liquor
   end

   def get_drink_by_sec_mixer
   end

   def get_drink_by_any_ingredient
   end

   def drink_count
    self.drink.length
   end


   

    
    

end