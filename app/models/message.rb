class Message < ApplicationRecord
has_many :account_messages
has_many :accounts, :through => :account_messages
has_many :user_messages
has_many :users, :through => :user_messages
has_many :comments, as: :commentable

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

  def self.dead_end_breaker_options
    ["yes", "no"]
  end

  def ids_of_children(account)
    children = self.children.order(:order).pluck(:id) - account.messages.pluck(:id)

    if children.empty?
      #children = self.children.where(dead_end_breaker: "yes").pluck(:id)
      children = self.children.order(:order).pluck(:id)
    end

    children
  end

  def to_node

    target_message = Message.where(id: self.target_message_id).map { |c| c.to_node }
    children = self.children.map { |c| c.to_node }

    both = target_message + children

    { "name" => ActionController::Base.helpers.strip_tags(self.content.to_s),
      "id_of_message" => self.id,
      "children" => both
      #{}"children"   => self.children.map { |c| c.to_node }
    }
  end

  def to_node2(n)
    if n > 6
      last_node = { "name" => ActionController::Base.helpers.strip_tags(self.content.to_s),
            "id_of_message" => self.id,
          }
      return last_node
    end

    n = n + 1

    target_message = Message.where(id: self.target_message_id).map { |c| c.to_node2(n) }
    children = self.children.map { |c| c.to_node2(n) }

    both = target_message + children

    { "name" => ActionController::Base.helpers.strip_tags(self.content.to_s),
      "id_of_message" => self.id,
      "children" => both
      #{}"children"   => self.children.map { |c| c.to_node }
    }

  end

end
