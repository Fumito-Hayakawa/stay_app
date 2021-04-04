class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.integer :person_number, null:false
      t.integer :user_id
      t.integer :room_id
      t.integer :total_price, null:false

      t.timestamps
    end
  end
end
