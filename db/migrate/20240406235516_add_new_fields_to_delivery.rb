class AddNewFieldsToDelivery < ActiveRecord::Migration[7.1]
  def change
    add_column :deliveries, :signature, :string
    add_column :deliveries, :observations, :string
    add_column :deliveries, :delivery_photo, :string
  end
end
