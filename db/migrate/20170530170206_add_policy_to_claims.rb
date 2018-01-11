class AddPolicyToClaims < ActiveRecord::Migration[5.0]
  def change
    add_reference :claims, :policy, foreign_key: true
  end
end
