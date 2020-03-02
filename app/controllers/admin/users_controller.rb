class Admin::UsersController < Admin::BaseController
  def edit
  end

  def update
    if current_user.authenticate(params.require(:user)[:current_password])
      if current_user.update(user_params)
        sign_out
        redirect_to root_path, notice: 'Account has been updated, please log in again'
      else
        render 'edit'
      end
    else
      flash.now[:alert] = 'Old password is wrong, try again'
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
