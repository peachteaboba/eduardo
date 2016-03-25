class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def start_money
    [
        ['$100', 100],
        ['$500', 500],
        ['$1000', 1000],
        ['$5000', 5000],
        ['$10000', 10000],
        ['$100000', 100000]
    ]
  end
  helper_method :start_money



  def lend_money
    [
        ['$25', 25],
        ['$50', 50],
        ['$100', 100],
        ['$500', 500],
        ['$1000', 1000],
        ['$5000', 5000],
        ['$50000', 50000]
    ]
  end
  helper_method :lend_money










  def current_user
    if session[:lender_id]
      Lender.find(session[:lender_id])
    elsif session[:borrower_id]
      Borrower.find(session[:borrower_id])
    end
  end
  helper_method :current_user


  def require_login
    redirect_to '/' if session[:user_id] == nil
  end


  def require_correct_user
    user = nil
    if session[:lender_id]
      user = Lender.find(params[:id])
    elsif session[:borrower_id]
      user = Borrower.find(params[:id])
    end
    redirect_to "/" if current_user != user
  end






end
