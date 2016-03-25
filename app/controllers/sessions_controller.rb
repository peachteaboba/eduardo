class SessionsController < ApplicationController


  def register
  end

  def login
  end

  def create_lender
    l = Lender.new(register_lender_params)
    if l.save
      @lender = Lender.find_by(:email => register_lender_params[:email])
      session[:lender_id] = @lender.id
      redirect_to "/lender/#{session[:lender_id]}"
    else
      #errors
      flash[:errors] = l.errors.full_messages
      redirect_to :back
    end
  end

  def create_borrower
    temp = register_borrower_params
    temp[:raised] = 0
    b = Borrower.new(temp)
    if b.save
      @borrower = Borrower.find_by(:email => register_borrower_params[:email])
      session[:borrower_id] = @borrower.id
      redirect_to "/borrower/#{session[:borrower_id]}"
    else
      #errors
      flash[:errors] = b.errors.full_messages
      redirect_to :back
    end
  end


  def login_user
    @lender = Lender.find_by(:email => login_params[:email])
    if @lender
      if @lender.authenticate(login_params[:password])
        session[:lender_id] = @lender.id
        redirect_to "/lender/#{session[:lender_id]}"
      else
        flash[:errors] = ["Invalid Email or Password"]
        redirect_to :back
      end
    else
      @borrower = Borrower.find_by(:email => login_params[:email])
      if @borrower && @borrower.authenticate(login_params[:password])
        session[:borrower_id] = @borrower.id
        redirect_to "/borrower/#{session[:borrower_id]}"
      else
        flash[:errors] = ["Invalid Email or Password"]
        redirect_to :back
      end
    end
  end
















  def logout
    if session[:lender_id]
      session[:lender_id] = nil
    end

    if session[:borrower_id]
      session[:borrower_id] = nil
    end


    redirect_to '/'
  end




  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def register_lender_params
    params.require(:register_lender).permit(:first_name, :last_name, :email, :money, :password, :confirm_password)
  end
  def register_borrower_params
    params.require(:register_borrower).permit(:first_name, :last_name, :email, :money, :purpose, :description, :password, :confirm_password)
  end
  def login_params
    params.require(:login).permit(:email, :password)
  end


end
