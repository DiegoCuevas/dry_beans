class AddNewColumnsToDelivery < ActiveRecord::Migration[7.1]
  def change
    add_column :deliveries, :sender_first_name, :string
    add_column :deliveries, :sender_last_name, :string
    add_column :deliveries, :sender_full_name, :string
    add_column :deliveries, :receiver_signature, :string
    add_column :deliveries, :receiver_first_name, :string
    add_column :deliveries, :receiver_last_name, :string
    add_column :deliveries, :receiver_full_name, :string
  end
end
