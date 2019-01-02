class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] #current_userが定義されていなければ右辺を代入
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
