class CreateClaims < ActiveRecord::Migration[5.0]
  def change
    create_table :claims do |t|
      t.string :number
      t.date :period_begin
      t.date :period_end
      t.date :loss_date
      t.string :company_number
      t.string :rating_method
      t.decimal :bldg_limit, precision: 14, scale: 2
      t.decimal :bldg_ded, precision: 14, scale: 2
      t.decimal :bldg_res, precision: 14, scale: 2
      t.decimal :con_limit, precision: 14, scale: 2
      t.decimal :con_ded, precision: 14, scale: 2
      t.decimal :con_res, precision: 14, scale: 2
      t.string :floors
      t.string :enclosure_type
      t.string :con_location
      t.string :flood_program
      t.string :flood_risk_zone
      t.string :flood_comm_number
      t.string :elevated_ind
      t.decimal :low_floor_elev, precision: 12, scale: 3
      t.decimal :flood_elev, precision: 12, scale: 3
      t.date :construction_date
      t.string :post_firm_ind
      t.string :obstruction_code
      t.integer :num_units
      t.boolean :primary_res
      t.string :condo_code
      t.decimal :rep_val, precision: 14, scale: 2
      t.string :contact_first
      t.string :contact_middle
      t.string :contact_last
      t.string :contact_home
      t.string :contact_work
      t.string :contact_cell

      t.timestamps
    end
  end
end
