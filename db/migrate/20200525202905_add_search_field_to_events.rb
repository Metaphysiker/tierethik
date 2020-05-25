class AddSearchFieldToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :search_field, :text
  end
end
