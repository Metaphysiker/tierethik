class Message < ApplicationRecord
has_many :account_messages
has_many :accounts, :through => :account_messages
has_many :user_messages
has_many :users, :through => :user_messages

  has_ancestry

  def self.categories
    ["only_text", "video"]
  end

  def self.chatters
    ["vegan", "user"]
  end

  def self.starting_points
    ["yes", "no"]
  end

end
