class CreateSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slides do |t|
      t.string :name, default: ""
      t.text :content, default: ""

      t.timestamps
    end
  end
end
