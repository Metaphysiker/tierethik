class Event < ApplicationRecord
before_save :update_search_field
before_save :update_longitude_latitude
scope :events_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

#geocoded_by :location
#after_validation :geocode

extend FriendlyId
friendly_id :title, use: :slugged

def update_longitude_latitude
  results = Geocoder.search(self.location)
  if results.nil?
    self.longitude = 0.0
    self.latitude = 0.0
  else
    self.longitude = results.first.coordinates[1]
    self.latitude = results.first.coordinates[0]
  end
end

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
