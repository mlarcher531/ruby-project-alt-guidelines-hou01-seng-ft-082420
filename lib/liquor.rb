class Liquor < ActiveRecord::Base
    has_many :drinks

    def get_drinks
        self.drink
    end

    def get_drink_names
        self.drinks.name
    end

end