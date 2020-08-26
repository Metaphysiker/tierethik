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

  def to_node

    target_message = Message.where(id: self.target_message_id).map { |c| c.to_node }
    children = self.children.map { |c| c.to_node }

    both = target_message + children

    { "name" => ActionController::Base.helpers.strip_tags(self.content.to_s),
      "children" => both
      #{}"children"   => self.children.map { |c| c.to_node }
    }
  end

end
