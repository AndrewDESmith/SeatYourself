class AddIsOwnerToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_restaurant_owner, :boolean
  end
end
