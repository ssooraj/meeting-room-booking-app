class RenameEmployeeIdToUserIdInBookings < ActiveRecord::Migration[5.0]
  def change
    rename_column :bookings, :employee_id, :user_id
  end
end
