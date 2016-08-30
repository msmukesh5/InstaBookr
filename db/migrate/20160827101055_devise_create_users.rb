class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      t.string   :first_name  
      t.string   :last_name
      t.string   :uuid, :limit => 20,   :null => false
      t.string   :contact_number1,      :limit => 10
      t.string   :contact_number2,      :limit => 10
      t.string   :loyality_discount_at, :default => "[]"
      t.integer  :number_of_bookings,   :default => 0
      t.integer  :money_transaction,    :default => 0, :limit => 8


      t.boolean  :is_owner,           :default => false
      t.boolean  :is_first_logged_in,   :default => false
      t.boolean  :is_super_user,      :default => false
      t.string   :user_last_location,   :default => ""
      t.string   :status,               :default => "Active"

      # Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
    # add_index :users, :uuid,                 unique: true
  end
end
