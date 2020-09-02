class AddOrderToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :order, :integer, default: 5
  end
end
