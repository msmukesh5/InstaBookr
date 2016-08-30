class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|

    	t.string :uuid, :null => false, :limit => 20
        t.string :shop_id, :null => false
        t.string :name
        t.integer :cost, :null => false
        t.string :status, :default => "Active"
      	t.timestamps
    end
    add_index(:services, :shop_id)
  end
end
