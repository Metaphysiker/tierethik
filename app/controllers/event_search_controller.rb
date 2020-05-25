class EventSearchController < ApplicationController

  def search_example
    @events = Event.all
  end

  def search
    if params[:search_inputs].present?
      @search_inputs = OpenStruct.new(params[:search_inputs])
    else
      @search_inputs = OpenStruct.new()
    end
  @events = EventSearch.new(@search_inputs).search

    respond_to do |format|
      format.js
    end
  end
end
