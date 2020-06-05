class AddHyperlinkToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :hyperlink, :string, default: ""
  end
end
