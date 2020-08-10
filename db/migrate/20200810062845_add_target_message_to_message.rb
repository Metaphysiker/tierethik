class AddTargetMessageToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :target_message_id, :integer, default: 1
    add_column :messages, :target_message_id_for_option, :integer, default: 1
  end
end
