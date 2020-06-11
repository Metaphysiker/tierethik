class AddPublishedToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :published, :string, default: "yes"
  end
end
