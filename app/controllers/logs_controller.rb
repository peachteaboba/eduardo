class LogsController < ApplicationController

  def create
    borrower = Borrower.find(lend_params[:borrower_id])

    if current_user.money >= lend_params[:amount].to_f
      Log.create(lender: current_user, borrower: borrower, amount: lend_params[:amount])

      borrower.update(raised: borrower.raised + lend_params[:amount].to_f)

      current_user.update(money: current_user.money - lend_params[:amount].to_f)
    else
      flash[:errors] = ["Insufficient Funds..."]
    end

    redirect_to :back
  end



  def lend_params
    params.require(:lend).permit(:amount, :borrower_id)
  end

end
