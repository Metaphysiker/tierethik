class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.integer :current_slide, default: 1

      t.timestamps
    end
  end
end
