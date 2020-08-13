class VeganChatController < ApplicationController
  before_action :set_account

  def chat
    response.headers["X-FRAME-OPTIONS"] = "ALLOWALL"
    render layout: "application_chat"
  end

  def get_message
    message_id = params[:message]
    @message = Message.find(message_id)
  end

  def get_button
    message_id = params[:message]
    @message = Message.find(message_id)
  end

  def select_button
    message_id = params[:message]
    @message = Message.find(message_id)

    target_message_id = params[:target_message]
    @target_message = Message.find(target_message_id)
  end

  def get_video

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
