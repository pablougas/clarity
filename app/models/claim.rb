class Claim < ApplicationRecord
    belongs_to :policy
    validates_presence_of :policy

    has_many :adjusters, dependent: :destroy
    has_one :examiner, dependent: :destroy
    has_one :agent, dependent: :destroy
    has_many :mortgagees, dependent: :destroy
    has_many :remarks, dependent: :destroy
end
