class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :current_name_of_slide, default: "start"

      t.timestamps
    end
  end
end
