class AddDefaultsToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column_default :events, :title, ""
    change_column_default :events, :description, ""
    change_column_default :events, :content, ""
  end
end
