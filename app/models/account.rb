class Account < ApplicationRecord
has_many :account_options
has_many :options, :through => :account_options
has_many :account_slides
has_many :slides, :through => :account_slides
end
