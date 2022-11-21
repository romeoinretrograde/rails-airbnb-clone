class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :pig, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.boolean :status

      t.timestamps
    end
  end
end
