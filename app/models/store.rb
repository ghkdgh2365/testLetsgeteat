class Store < ActiveRecord::Base
    has_many :menus
    has_many :reviews
    has_many :locations
end
