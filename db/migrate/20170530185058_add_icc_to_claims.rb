class AddIccToClaims < ActiveRecord::Migration[5.0]
  def change
    add_column :claims, :icc_limit, :decimal, precision: 14, scale: 2
    add_column :claims, :icc_ded, :decimal, precision: 14, scale: 2
    add_column :claims, :icc_res, :decimal, precision: 14, scale: 2
  end
end
