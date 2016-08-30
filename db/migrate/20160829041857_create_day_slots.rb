class CreateDaySlots < ActiveRecord::Migration[5.0]
  def change
    create_table :day_slots do |t|

    	t.string :day
      	t.timestamps
    end
    add_index(:day_slots, :day)
  end
end
