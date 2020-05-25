class AddStartToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :start_of_date, :datetime
    add_column :events, :end_of_date, :datetime
  end
end
