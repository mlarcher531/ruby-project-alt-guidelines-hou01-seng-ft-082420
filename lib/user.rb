class User < ActiveRecord::Base
    has_many :drinks, through: :fav_list
    has_many :liquors, through: :drinks
    has_many :mixers, through: :drinks
    has_many :secondary_liquors, through: :drinks
    has_many :secondary_mixers, through: :drinks
    
    

end