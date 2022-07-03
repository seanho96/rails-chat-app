class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    ActionCable.server.broadcast 'chatroom_channel', body: render_message(message) if message.save
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
