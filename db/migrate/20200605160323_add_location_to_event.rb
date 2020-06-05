class AddLocationToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :location, :string, default: ""
  end
end
