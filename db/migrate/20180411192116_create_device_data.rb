class CreateDeviceData < ActiveRecord::Migration[5.0]
  def change
    create_table :device_data do |t|
      t.string :identifier
      t.datetime :date_time
      t.float :value
      t.string :unit

      t.timestamps
    end
  end
end
