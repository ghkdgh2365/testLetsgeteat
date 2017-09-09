class Store < ActiveRecord::Base
    has_many :menus
    has_many :reviews
    has_many :locations
    has_many :joayos
    has_many :users, :through => :joayos
end
