class AddClaimToExaminers < ActiveRecord::Migration[5.0]
  def change
    add_reference :examiners, :claim, foreign_key: true
  end
end
