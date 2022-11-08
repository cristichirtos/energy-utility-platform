class UsersController < BaseController
  skip_before_action :check_user_logged_in, only: :create
  before_action :check_user_permission, except: :create

  def index
    if params['for_dropdown'] == 'true'
      render json: User.where(admin: false).pluck(:id, :username).map {|id, username| { id: id, username: username }}
    else
      render json: User.all
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      raise ActiveRecord::RecordInvalid.new(user)
    end
  end

  def update
    if user.update(user_params)
      render json: user
    else
      raise ActiveRecord::RecordInvalid.new(user)
    end
  end

  def destroy
    render json: User.find(params[:id]).destroy
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.permit(:username, :name, :password, :password_confirmation)
  end

  def check_user_permission
    raise ApplicationController::ForbiddenError unless current_user.admin? || current_user.id == params[:id]&.to_i
  end
end
