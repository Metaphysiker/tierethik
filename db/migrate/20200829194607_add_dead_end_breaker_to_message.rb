class AddDeadEndBreakerToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :dead_end_breaker, :string, default: "no"
  end
end
