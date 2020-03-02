class Admin::SessionsController < Admin::BaseController
  skip_before_action :authenticate_user!, only: [:new, :create]

  before_action do
    @full_render = true
  end

  def new
  end

  def create
    user = User::AsSignIn.find_by(username: params[:username])
    if user
      if user.locked?
        render json: {status: 403, uri: params[:uri]}, status: :forbidden, :content_type => 'text/html'
      else
        if user.authenticate(params[:password])
          sign_in(user)
          redirect_to root_path
        else
          flash.now[:alert] = 'Username or password is wrong'
          render 'new'
        end
      end
    else
      flash.now[:alert] = 'Username is not exist'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to admin_login_path
  end
end
