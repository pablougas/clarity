class CreateClientFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :client_files do |t|
      t.string :client_number

      t.timestamps
    end
  end
end
