class Admin::BaseController < ActionController::Base
  layout 'login'

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_user

  private

  def authenticate_user!
    redirect_to admin_login_path unless current_user
  end

  def current_user
    User.fetch_by_uniq_keys!(uuid: session[:uuid])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def sign_in(user)
    session[:uuid] = user.uuid
  end

  def sign_out
    reset_session
  end
end
