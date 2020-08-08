class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :category, default: "only_text"
      t.string :name, default: ""
      t.string :chatter, default: "vegan"
      t.text :content, default: ""

      t.timestamps
    end
  end
end
