class CreateInsurers < ActiveRecord::Migration[5.0]
  def change
    create_table :insurers do |t|
      t.string :name
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :state
      t.string :zip
      t.references :policy, foreign_key: true

      t.timestamps
    end
  end
end
