class AddColumnAddressToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :address, :string
  end
end
