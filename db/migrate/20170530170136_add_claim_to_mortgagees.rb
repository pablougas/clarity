class AddClaimToMortgagees < ActiveRecord::Migration[5.0]
  def change
    add_reference :mortgagees, :claim, foreign_key: true
  end
end
