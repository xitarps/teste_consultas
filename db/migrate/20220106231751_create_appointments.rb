class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.datetime :visit_date

      t.timestamps
    end
  end
end
