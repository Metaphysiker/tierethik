class Message < ApplicationRecord

  has_ancestry

  def self.categories
    ["only_text", "video"]
  end

  def self.chatters
    ["vegan", "user"]
  end

end
