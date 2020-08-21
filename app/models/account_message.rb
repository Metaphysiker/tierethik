class AccountMessage  < ApplicationRecord
  belongs_to :account
  belongs_to :message
end
