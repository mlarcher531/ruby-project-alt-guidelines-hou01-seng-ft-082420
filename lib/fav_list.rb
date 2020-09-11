class Fav_List < ActiveRecord::Base
    belongs_to :user
    has_many :drinks

    #what do we want to do?
end