class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :content, default: ""
      t.string :target_slide, default: ""
      t.belongs_to :slide

      t.timestamps
    end
  end
end
