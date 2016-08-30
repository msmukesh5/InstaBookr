class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|

    	t.string :offer_name
    	t.integer :service_id, :default => 0 # offer not assigned to any service
        t.integer :shop_id, :default => 0    # offer not assigned to any shop
        t.datetime :start_date_time
        t.datetime :end_date_time
    	t.boolean :is_day_offer
    	t.boolean :is_time_slot_offer
    	t.string :time_slot, :default => "[]"
    	t.string :day_slot, :default => "[]"
    	t.integer :discount, :default => 0   # in percentage
        t.string :status, :default => "Active"
        t.timestamps

    end
    add_index(:offers, :offer_name)
    add_index(:offers, :service_id)
  end
end
