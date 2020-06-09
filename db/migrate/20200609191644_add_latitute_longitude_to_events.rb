class AddLatituteLongitudeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :latitude, :decimal, default: 0
    add_column :events, :longitude, :decimal, default: 0
  end
end
