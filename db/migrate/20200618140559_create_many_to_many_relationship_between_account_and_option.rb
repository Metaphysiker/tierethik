class CreateManyToManyRelationshipBetweenAccountAndOption < ActiveRecord::Migration[6.0]
  def change
    create_table :account_options do |t|
      t.belongs_to :account
      t.belongs_to :option
      t.timestamps
    end
  end
end
