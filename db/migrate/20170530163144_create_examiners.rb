class CreateExaminers < ActiveRecord::Migration[5.0]
  def change
    create_table :examiners do |t|
      t.string :first
      t.string :middle
      t.string :last

      t.timestamps
    end
  end
end
