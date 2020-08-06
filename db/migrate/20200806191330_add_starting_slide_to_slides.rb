class AddStartingSlideToSlides < ActiveRecord::Migration[6.0]
  def change
    add_column :slides, :starting_slide, :string, default: "no"
  end
end
