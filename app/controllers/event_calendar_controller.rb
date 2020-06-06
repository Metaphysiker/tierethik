class EventCalendarController < ApplicationController

  def event_calendar
    date = params[:date]
    if date.nil? || date.empty?
      @date = Date.today
    else
      @date = Date.parse(date)
    end

    only_month_days = @date.beginning_of_month..@date.end_of_month
    @events = Event.where(start_of_date: only_month_days).order(:start_of_date)

  end

  def action_map
    
  end
end
