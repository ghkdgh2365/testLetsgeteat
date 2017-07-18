class Review < ActiveRecord::Base
    resourcify
    include Authority::Abilities
    belongs_to :user
    belongs_to :store
end
