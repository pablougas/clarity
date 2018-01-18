class CreateAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :auths do |t|
      t.references :user, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
