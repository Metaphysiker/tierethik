class Page < ApplicationRecord
  has_one_attached :cover
  extend FriendlyId
  friendly_id :title, use: :slugged
end
