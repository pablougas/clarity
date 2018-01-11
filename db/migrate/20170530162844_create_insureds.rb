class CreateInsureds < ActiveRecord::Migration[5.0]
  def change
    create_table :insureds do |t|
      t.string :insured_type
      t.string :full_name
      t.string :first
      t.string :middle
      t.string :last
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :home
      t.string :work

      t.timestamps
    end
  end
end
