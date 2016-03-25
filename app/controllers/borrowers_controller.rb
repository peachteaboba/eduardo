class BorrowersController < ApplicationController
  before_action :require_login
  before_action :require_correct_user, only: [:show]


  def show
    @borrower = Borrower.find(params[:id])

    # @my_lenders = Log.where(borrower_id: params[:id]).joins(:lender).select("*")



    @my_lenders_id = Log.where(borrower_id: params[:id]).uniq.pluck(:lender_id)


    @display = []

    @my_lenders_id.each do |id|
      l = Lender.find(id)
      l[:id] = Log.where(borrower_id: params[:id], lender_id: id).sum(:amount)

      @display.push(l)

    end




  end


end
