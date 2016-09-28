class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|

    	t.string :uuid, :null => false, :limit => 20
        t.string :shop_id, :null => false
        t.string :name
        t.integer :cost_daily, :null => false, :default => 0
        t.integer :cost_monthly, :default => 0
        t.integer :cost_quartly, :default => 0
        t.integer :cost_halfyearly, :default => 0
        t.integer :cost_yearly, :default => 0
        t.string :status, :default => "Active"
      	t.timestamps
    end
    add_index(:services, :shop_id)
  end
end
