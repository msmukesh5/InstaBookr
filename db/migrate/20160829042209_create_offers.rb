class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|

    	t.string :offer_name
        t.string :uuid
        t.string :code
    	t.integer :service_id, :default => 0 # offer not assigned to any service
        t.integer :shop_id, :default => 0    # offer not assigned to any shop
        t.datetime :start_date_time, :default => DateTime.now
        t.datetime :end_date_time, :default => (DateTime.now + 1.day)
        t.integer :cost_daily, :null => false, :default => 0
        t.integer :cost_monthly, :default => 0
        t.integer :cost_quartly, :default => 0
        t.integer :cost_halfyearly, :default => 0
        t.integer :cost_yearly, :default => 0
        t.string :status, :default => "Active"
        t.timestamps

    end
    add_index(:offers, :offer_name)
    add_index(:offers, :service_id)
    add_index(:offers, :end_date_time)
  end
end
