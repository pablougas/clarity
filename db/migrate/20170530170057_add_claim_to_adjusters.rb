class AddClaimToAdjusters < ActiveRecord::Migration[5.0]
  def change
    add_reference :adjusters, :claim, foreign_key: true
  end
end
