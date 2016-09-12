class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :employee
      t.references :room
      t.datetime   :start_time
      t.datetime   :end_time

      t.timestamps
    end
  end
end
