class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.recent
    @message = Message.new
  end
end
