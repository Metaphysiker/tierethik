class AddFeedOriginToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :feed_origin, :string, default: ""
  end
end
