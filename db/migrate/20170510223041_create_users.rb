class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
