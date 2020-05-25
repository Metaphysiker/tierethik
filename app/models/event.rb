class Event < ApplicationRecord
before_save :update_search_field
scope :events_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

def update_search_field
  self.search_field =
[
 ""
].compact.join(' ')
end

  has_one_attached :cover

  scope :incoming, -> { where("start_of_date > ?", DateTime.now).order("start_of_date") }

end
