class AddPortraitNameToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :portrait_name, :string, default: "portrait_frau.png"
  end
end
