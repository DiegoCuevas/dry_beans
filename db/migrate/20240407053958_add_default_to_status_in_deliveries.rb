class AddDefaultToStatusInDeliveries < ActiveRecord::Migration[7.1]
  def change
    change_column :deliveries, :status, :integer, default: 1
  end
end
