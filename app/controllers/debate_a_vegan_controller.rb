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

  def go_one_slide_back

    latest_slide = @account.account_slides.order(:created_at).last.slide
    latest_option = @account.account_options.order(:created_at).last.option

    @account.options.delete(latest_option)
    @account.slides.delete(latest_slide)

    latest_slide = @account.account_slides.order(:created_at).last.slide

    @account.update(current_slide: latest_slide)
    @slide = latest_slide
  end

  def reset_debate
    create_a_new_account
    redirect_to debate_a_vegan_path
  end

  def chat
    render layout: "application_chat"
  end

  def load_video

  #  option_id = params[:option]

  #  option = Option.find(option_id)

  #  target_slide = Slide.find(option.target_slide)

  #  @account.update(current_slide: option.target_slide)

  #  @account.slides << target_slide
  #  @account.options << option

  #  @slide = target_slide

  end

  def load_message

    option_id = params[:option]

    option = Option.find(option_id)

    target_slide = Slide.find(option.target_slide)

    @account.update(current_slide: option.target_slide)

    @account.slides << target_slide
    @account.options << option

    @slide = target_slide

  end

  def load_starting_slide

    starting_slide = params[:starting_slide]

    #option = Option.find(option_id)

    target_slide = Slide.find(starting_slide)

    @account.update(current_slide: starting_slide)

    @account.slides << target_slide
    #@account.options << option

    @slide = target_slide

  end

  private

  def set_account
    if cookies["debate-a-vegan-cookie-id"].present?
      if Account.exists?(cookies["debate-a-vegan-cookie-id"])
        @account = Account.find(cookies["debate-a-vegan-cookie-id"])
      else
        create_a_new_account
      end
    else
      create_a_new_account
    end
  end

  def create_a_new_account
    slide_to_begin = Slide.find(1)
    @account = Account.create
    cookies.permanent["debate-a-vegan-cookie-id"] = @account.id
    @account.update(current_slide: slide_to_begin)
    @account.slides << slide_to_begin
  end


end
