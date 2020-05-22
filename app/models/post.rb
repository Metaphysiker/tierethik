class Post < ApplicationRecord
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
