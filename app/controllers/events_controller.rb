require 'icalendar'
require 'icalendar/tzinfo'

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :to_icalendar]

  # GET /events
  # GET /events.json
  def index
    @events = Event.incoming.published
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    authorize @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    authorize @event
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    authorize @event
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def api_events
    @events = Event.incoming.published
    render json: @events.to_json
  end

  def icalendar
    @events = Event.incoming.published
    cal = Icalendar::Calendar.new
    filename = "tierethik-events"
    tzid = "Europe/Zurich"
    cal.x_wr_calname = 'Kennsch Ethik?'

    if params[:format] == 'vcs'
      #cal.prodid = '-//Microsoft Corporation//Outlook MIMEDIR//EN'
      cal.version = '1.0'
      filename += '.vcs'
    else # ical
      #cal.prodid = '-//Acme Widgets, Inc.//NONSGML ExportToCalendar//EN'
      cal.version = '2.0'
      filename += '.ics'
    end

    cal.timezone do |t|
      t.tzid = tzid
      t.daylight do |d|
        d.tzoffsetfrom = "+0100"
        d.tzoffsetto   = "+0200"
        d.tzname       = "CEST"
        d.dtstart      = "19700329T020000"
        #d.rrule        = "FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU"
      end

      t.standard do |s|
        s.tzoffsetfrom = "+0200"
        s.tzoffsetto   = "+0100"
        s.tzname       = "CET"
        s.dtstart      = "19701025T030000"
        s.rrule        = "FREQ=YEARLY;BYMONTH=10;BYDAY=-1SU"
      end
    end

    @events.each do |event|
      cal.event do |e|
        e.dtstart     = Icalendar::Values::DateTime.new event.start_of_date, 'tzid' => tzid
        e.dtend       = Icalendar::Values::DateTime.new event.end_of_date, 'tzid' => tzid
        e.summary     = event.title
        e.description = event.description
        e.url         = event.hyperlink
        e.location    = event.location
      end
    end

    cal.publish

    send_data cal.to_ical, type: 'text/calendar', disposition: 'attachment', filename: filename
    #render plain: cal.to_ical
  end

  def to_icalendar

    cal = Icalendar::Calendar.new
    filename = @event.title
    tzid = "Europe/Zurich"
    cal.x_wr_calname = 'Kennsch Ethik?'

    if params[:format] == 'vcs'
      #cal.prodid = '-//Microsoft Corporation//Outlook MIMEDIR//EN'
      cal.version = '1.0'
      filename += '.vcs'
    else # ical
      #cal.prodid = '-//Acme Widgets, Inc.//NONSGML ExportToCalendar//EN'
      cal.version = '2.0'
      filename += '.ics'
    end

    cal.timezone do |t|
      t.tzid = tzid
      t.daylight do |d|
        d.tzoffsetfrom = "+0100"
        d.tzoffsetto   = "+0200"
        d.tzname       = "CEST"
        d.dtstart      = "19700329T020000"
        #d.rrule        = "FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU"
      end

      t.standard do |s|
        s.tzoffsetfrom = "+0200"
        s.tzoffsetto   = "+0100"
        s.tzname       = "CET"
        s.dtstart      = "19701025T030000"
        s.rrule        = "FREQ=YEARLY;BYMONTH=10;BYDAY=-1SU"
      end
    end

    event = @event
    cal.event do |e|
      e.dtstart     = Icalendar::Values::DateTime.new event.start_of_date, 'tzid' => tzid
      e.dtend       = Icalendar::Values::DateTime.new event.end_of_date, 'tzid' => tzid
      e.summary     = event.title
      e.description = event.description
      e.url         = event.hyperlink
      e.location    = event.location
    end

    cal.publish

    send_data cal.to_ical, type: 'text/calendar', disposition: 'attachment', filename: filename
    #render plain: cal.to_ical
  end

  def new_event_for_non_users
    @event = Event.new
  end

  def create_event_for_non_users
    @event = Event.new(event_params)

    @event.published = "no"

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_calendar_path, notice: 'Vielen Dank! Event wird nach einem Review freigeschaltet.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:location, :hyperlink, :cover,
:title, :description, :content, :start_of_date, :end_of_date, :published)
    end
end
