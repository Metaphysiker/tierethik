class AddUrlToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :video_url, :string, default: ""
  end
end
