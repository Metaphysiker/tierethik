class AddSearchFieldToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :search_field, :text
  end
end
