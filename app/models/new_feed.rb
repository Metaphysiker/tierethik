require 'net/http'

class NewFeed

  def initialize(feed_name, feed_file)
    @feed_name = feed_name
    @feed_file = feed_file
    #byebug
  end

  #https://www.swissveg.ch/iCal

  def get_feed
    Event.where(feed_origin: @feed_name).delete_all

    #NewFeed.new("swissveg", "https://www.swissveg.ch/iCal").get_feed
    #event_file = File.open("event.ics")
    uri = URI(@feed_file)
    calendar = Net::HTTP.get(uri)

    #puts calendar.inspect
    #event_file = File.open(@feed_file)

    #events = Icalendar::Event.parse(calendar)
    events = Icalendar::Event.parse(calendar)

    events.each do |event|
      Event.create(
        title: event.summary.force_encoding('utf-8'),
        content: event.description.force_encoding('utf-8'),
        location: event.location.nil? ? "" : event.location.force_encoding('utf-8'),
        start_of_date: event.dtstart,
        end_of_date: event.dtend,
        hyperlink: event.url.to_s,
        feed_origin: @feed_name
                  )
    end
    #puts "start date-time: #{event.dtstart}"
    #puts "start date-time timezone: #{event.dtstart.ical_params['tzid']}"
    #puts "summary: #{event.summary}"
  end

end
