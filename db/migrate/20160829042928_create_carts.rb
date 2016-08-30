class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|

        t.integer :user_id, :null => false
    	t.integer :shop_id, :null => false
      	t.integer :service_id, :null => false
        t.string :status, :default => "Active"
      	t.timestamps
    end
    add_index(:carts, :shop_id)
    add_index(:carts, :service_id)
    add_index(:carts, :user_id)
  end
end
