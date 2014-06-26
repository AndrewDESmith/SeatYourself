class CategoryRestaurant < ActiveRecord::Migration
  def change
    create_table :categories_restaurants do |t|
      t.references :category, index: true
      t.references :restaurant, index: true
    end
  end
end
