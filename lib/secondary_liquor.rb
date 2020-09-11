class SecondaryLiquor < ActiveRecord::Base
    has_many :drinks

    def get_drinks
        self.drinks
    end
end