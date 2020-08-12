class RemoveDefaultFromMessage < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:messages, :target_message_id, nil)
    change_column_default(:messages, :target_message_id_for_option, nil)
  end
end
