class UsersController < ApplicationController
  def show
    if user
      render json: user
    else
      render json: { error: 'not-found' }.to_json, status: :not_found
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    return render json: { error: 'not-found' }.to_json, status: :not_found if user.nil?

    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return render json: { error: 'not-found' }.to_json, status: :not_found if user.nil?

    render json: user.destroy!
  end

  private

  def user
    return @user if defined?(@user)

    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation, :admin)
  end
end
