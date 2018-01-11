class CreateAdjusters < ActiveRecord::Migration[5.0]
  def change
    create_table :adjusters do |t|
      t.string :company
      t.string :first
      t.string :middle
      t.string :last
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.date :asigned_date

      t.timestamps
    end
  end
end
