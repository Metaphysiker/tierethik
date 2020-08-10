class AddAncestryToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :ancestry, :string
    add_index :messages, :ancestry
  end
end
