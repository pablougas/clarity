class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.boolean :admin
      t.boolean :assessor
      t.boolean :estimator
      t.boolean :active

      t.timestamps
    end
  end
end
