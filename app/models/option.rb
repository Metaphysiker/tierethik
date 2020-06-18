class Option < ApplicationRecord
has_many :account_options
has_many :accounts, :through => :account_options
  belongs_to :slide
end
