class ChatsController < BaseController
  before_action :check_admin

  def index
    render json: Message.where(receiver: 4).map { |m| { user_id: m.sender_id }}.uniq
  end

  private

  def check_admin
    raise ApplicationController::ForbiddenError unless current_user.admin?
  end
end
