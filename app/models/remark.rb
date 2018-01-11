class Remark < ApplicationRecord
    belongs_to :claim
    validates_presence_of :claim
end
