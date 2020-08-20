class AddSleepTimeToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :sleep_time, :integer, default: 2000
  end
end
