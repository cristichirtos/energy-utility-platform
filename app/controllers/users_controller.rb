class UsersController < BaseController
  skip_before_action :check_user_logged_in, only: :create
  before_action :check_user_permission, except: :create

  def index
    render json: User.all
  end

  def show
    render json: user
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
    render json: user.destroy!
  end

  private

  def user
    return @user if defined?(@user)

    @user = User.find(params[:id])

    raise ActiveRecord::RecordNotFound if @user.nil?
  end

  def user_params
    params.permit(:username, :name, :password, :password_confirmation)
  end

  def check_user_permission
    raise ApplicationController::ForbiddenError unless current_user.admin? || current_user.id == params[:id]&.to_i
  end
end
