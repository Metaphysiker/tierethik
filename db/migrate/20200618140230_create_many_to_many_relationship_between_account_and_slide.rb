class CreateManyToManyRelationshipBetweenAccountAndSlide < ActiveRecord::Migration[6.0]
  def change
    create_table :account_slides do |t|
      t.belongs_to :account
      t.belongs_to :slide
      t.timestamps
    end
  end
end
