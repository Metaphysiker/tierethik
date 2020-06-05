class Event < ApplicationRecord
before_save :update_search_field
scope :events_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

extend FriendlyId
friendly_id :title, use: :slugged


def update_search_field
  self.search_field =
[
 ""
].compact.join(' ')
end

  has_one_attached :cover

  scope :incoming, -> { where("start_of_date > ?", DateTime.now - 1.day).order("start_of_date") }
  #scope :between ->(start_of_date, end_of_date) { where('start_of_date BETWEEN ? AND ?', start_of_date, end_of_date) }
  scope :between, -> (start_of_date, end_of_date) { where(start_of_date: start_of_date..end_of_date) }

end
