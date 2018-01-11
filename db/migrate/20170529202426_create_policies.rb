class CreatePolicies < ActiveRecord::Migration[5.0]
  def change
    create_table :policies do |t|
      t.string :number
      t.date :effective_date
      t.string :policy_type
      t.string :agency
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :state
      t.integer :zip
      t.string :occupancy_type

      t.timestamps
    end
  end
end
