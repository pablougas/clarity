class CreateRemarks < ActiveRecord::Migration[5.0]
  def change
    create_table :remarks do |t|
      t.text :content

      t.timestamps
    end
  end
end
