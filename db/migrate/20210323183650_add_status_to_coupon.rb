class AddStatusToCoupon < ActiveRecord::Migration[6.1]
  def change
    add_column :coupons, :status, :integer, null: false, default: 0
  end
end
