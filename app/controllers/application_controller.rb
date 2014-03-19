class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  # Before filters

  def signed_in_user
    if current_user.nil?
      flash[:danger] = "권한이 없습니다. 로그인 이후 이용바랍니다."
      redirect_to root_path
    end
  end

  def correct_user
    @user = Item.find(params[:id]).user
    if current_user == @user
    else
      flash[:danger] = "권한이 없습니다. 관리자에게 문의하세요. 나름 예외처리 잘해놨지? 뿌듯뿌듯 :)"
      redirect_to root_path
    end
  end
end
