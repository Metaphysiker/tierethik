class AddShowSuggestionToSlides < ActiveRecord::Migration[6.0]
  def change
    add_column :slides, :show_suggestion, :string, default: "yes"
  end
end
