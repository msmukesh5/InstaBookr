class AddShopServiceTypeInServices < ActiveRecord::Migration[5.0]
  def change
  		
  		add_column :services, :shop_service_type_id, :integer
  		add_index :services, :shop_service_type_id

  end
end
