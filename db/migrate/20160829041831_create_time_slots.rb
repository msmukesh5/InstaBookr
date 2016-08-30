class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|

    	t.string :time_frame
      	t.timestamps
    end

    add_index(:time_slots, :time_frame)

  end
end
