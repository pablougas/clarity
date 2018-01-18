class User < ApplicationRecord
    has_one :auth
    accepts_nested_attributes_for :auth

    def self.password
        auth.password
    end
end
