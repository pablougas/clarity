class AddClaimToRemarks < ActiveRecord::Migration[5.0]
  def change
    add_reference :remarks, :claim, foreign_key: true
  end
end
