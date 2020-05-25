class Post < ApplicationRecord
has_many :post_tags
has_many :tags, :through => :post_tags
before_save :update_search_field
scope :posts_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

def update_search_field
  self.search_field =
[
 ""
].compact.join(' ')
end
extend FriendlyId
friendly_id :title, use: :slugged
before_save :update_search_field
scope :posts_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

def update_search_field
  self.search_field =
[
 "",
 title,
 description,
 ActionController::Base.helpers.sanitize(content)
].compact.join(' ')
end
      has_one_attached :cover
end
