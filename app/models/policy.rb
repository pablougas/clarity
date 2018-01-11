class Policy < ApplicationRecord
    has_many :claims, dependent: :destroy
    has_one :insurer, dependent: :destroy
    has_one :insured, dependent: :destroy
end
