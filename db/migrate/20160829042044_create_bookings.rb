class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|

    	t.string :uuid, :null => false, :limit => 20
    	t.integer :user_id, :null => false
    	t.integer :service_id, :null => false                 #service table uuid reference
    	t.string :time_slots, :default => "[]"
    	t.string :booking_token                               #auto generated token
      	t.integer :cost
    	t.string :status, :default => "Active"
    	t.datetime :date, :null => false
      	t.timestamps
    end
    add_index(:bookings, :user_id)
    add_index(:bookings, :service_id)
  end
end
