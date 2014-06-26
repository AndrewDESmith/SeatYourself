class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.integer :seats
      t.references :user, index: true
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
