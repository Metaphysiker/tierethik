class CreateManyToManyRelationshipBetweenAccountAndMessage < ActiveRecord::Migration[6.0]
  def change
    create_table :account_messages do |t|
      t.belongs_to :account
      t.belongs_to :message
      t.timestamps
    end
  end
end
