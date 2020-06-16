class DebateAVeganController < ApplicationController
  def debate
    response.headers["X-FRAME-OPTIONS"] = "ALLOWALL"
    render layout: "application_blank"
  end

  def load_slide
    @name_of_slide = params[:name_of_slide]
  end
end
