class CreateShopServiceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_service_types do |t|

    		t.string :name
    		t.integer :service_type_id

    end
  end
end
