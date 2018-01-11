class Insurer < ApplicationRecord
    belongs_to :policy
    validates_presence_of :policy
end
