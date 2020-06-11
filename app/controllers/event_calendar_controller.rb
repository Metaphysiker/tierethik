class EventCalendarController < ApplicationController

  def event_calendar
    date = params[:date]
    if date.nil? || date.empty?
      @date = Date.today
    else
      @date = Date.parse(date)
    end

    only_month_days = @date.beginning_of_month..@date.end_of_month
    calendar_days = @date.beginning_of_month.beginning_of_week..@date.end_of_month.end_of_week
    @events = Event.published.where(start_of_date: calendar_days).order(:start_of_date)
    #@events = Event.incoming.first(10)
    #byebug
  end

  def action_map
    @events = Event.published.incoming.first(10)
  end

  def event_list
    @events = Event.published.incoming
  end
end
