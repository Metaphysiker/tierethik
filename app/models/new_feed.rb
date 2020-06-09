require 'net/http'

class NewFeed

  def initialize(feed_name, feed_file)
    @feed_name = feed_name,
    @feed_file = feed_file
  end

  #https://www.swissveg.ch/iCal

  def get_feed
    #event_file = File.open("event.ics")
    uri = URI(@feed_file)
    calendar = Net::HTTP.get(uri)

    #puts calendar.inspect
    #event_file = File.open(@feed_file)

    #events = Icalendar::Event.parse(calendar)
    events = Icalendar::Event.parse(calendar)

    events.each do |event|
      
    end
    #puts "start date-time: #{event.dtstart}"
    #puts "start date-time timezone: #{event.dtstart.ical_params['tzid']}"
    #puts "summary: #{event.summary}"
  end

end
