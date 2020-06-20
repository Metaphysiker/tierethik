class AddStatusToOptions < ActiveRecord::Migration[6.0]
  def change
    add_column :options, :status, :string, default: "published"
    add_column :options, :email, :string, default: ""
  end
end
