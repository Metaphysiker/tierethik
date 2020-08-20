class AddVideoDurationToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :video_duration, :integer, default: 0
  end
end
