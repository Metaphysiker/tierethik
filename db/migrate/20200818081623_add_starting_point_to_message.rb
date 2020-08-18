class AddStartingPointToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :starting_point, :string, default: "no"
  end
end
