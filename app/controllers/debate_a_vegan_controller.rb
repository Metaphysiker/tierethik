class DebateAVeganController < ApplicationController
  before_action :set_account


  def debate

    if params[:slide].present?
      slide_id = params[:slide]
    elsif !@account.current_slide.blank?
      slide_id = @account.current_slide
    else
      slide_id = 1
    end

    @slide = Slide.find(slide_id)

    response.headers["X-FRAME-OPTIONS"] = "ALLOWALL"
    render layout: "application_blank"
  end

  def load_slide

    option_id = params[:option]

    option = Option.find(option_id)

    target_slide = Slide.find(option.target_slide)

    @account.update(current_slide: option.target_slide)

    @account.slides << target_slide
    @account.options << option

    @slide = target_slide

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
