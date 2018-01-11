class CreateMortgagees < ActiveRecord::Migration[5.0]
  def change
    create_table :mortgagees do |t|
      t.string :mortgagee_type
      t.boolean :first
      t.string :name
      t.string :first
      t.string :middle
      t.string :last
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
