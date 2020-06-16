class DebateAVeganController < ApplicationController
  before_action :set_account


  def debate

    if params[:name_of_slide].present?
      @name_of_slide = params[:name_of_slide]
    elsif !@account.current_name_of_slide.blank?
      @name_of_slide = @account.current_name_of_slide
    else
      @name_of_slide = "start"
    end

    response.headers["X-FRAME-OPTIONS"] = "ALLOWALL"
    render layout: "application_blank"
  end

  def load_slide
    @name_of_slide = params[:name_of_slide]
    @account.update(current_name_of_slide: @name_of_slide)
    @slide = Slide.find_by_name(@name_of_slide)
  end

  def reset_debate
    #cookies.permanent["debate-a-vegan-cookie-id"] = @account.id
    @account = Account.create
    cookies.permanent["debate-a-vegan-cookie-id"] = @account.id
    redirect_to debate_a_vegan_path
  end

  private

  def set_account
    if cookies["debate-a-vegan-cookie-id"].present?
      if Account.exists?(cookies["debate-a-vegan-cookie-id"])
        @account = Account.find(cookies["debate-a-vegan-cookie-id"])
      else
        @account = Account.create
        cookies.permanent["debate-a-vegan-cookie-id"] = @account.id
      end
    else
      @account = Account.create
      cookies.permanent["debate-a-vegan-cookie-id"] = @account.id
    end
  end
end
