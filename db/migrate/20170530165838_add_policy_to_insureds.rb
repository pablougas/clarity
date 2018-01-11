class AddPolicyToInsureds < ActiveRecord::Migration[5.0]
  def change
    add_reference :insureds, :policy, foreign_key: true
  end
end
