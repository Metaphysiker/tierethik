class Slide < ApplicationRecord
has_many :account_slides
has_many :accounts, :through => :account_slides
  has_many :options

  validates :name, uniqueness: true
end
