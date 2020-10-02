class Account < ApplicationRecord
has_many :account_messages
has_many :messages, :through => :account_messages
has_many :account_options
has_many :options, :through => :account_options
has_many :account_slides
has_many :slides, :through => :account_slides

after_create :set_portrait_name_for_chat

def set_portrait_name_for_chat
  random_portrait_name = ["portrait_mann.png", "portrait_frau.png"].shuffle.first
  self.update(portrait_name: random_portrait_name)
end

end
