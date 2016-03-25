class LendersController < ApplicationController
  before_action :require_login
  before_action :require_correct_user, only: [:show]




  def show
    @lender = Lender.find(params[:id])

    @borrowers_need_help = Borrower.all


    @my_borrowers_id = Log.where(lender_id: params[:id]).uniq.pluck(:borrower_id)


    @display = []

    @my_borrowers_id.each do |id|
      b = Borrower.find(id)
      b[:id] = Log.where(lender_id: params[:id], borrower_id: id).sum(:amount)

      @display.push(b)

    end


  end


end
