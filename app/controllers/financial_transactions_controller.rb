class FinancialTransactionsController < ApplicationController

  def index
    @transactions = FinancialTransaction.where("transaction_type= 'Debit' and voided= 'f'")
    respond_to do |format|
      format.html { render :index }
      format.js {}
    end
  end

  def create
    new_trans = FinancialTransaction.new(financial_transaction_params)
    if new_trans.save
      flash[:notice] = 'New transaction successfully recorded'
    else
      flash[:error] = 'New transaction could not be recorded'
    end
    respond_to do |format|
      format.html { render :index }
      format.js {}
    end
  end

  def update

  end

  private

  def financial_transaction_params
    params.require(:financial_transaction).permit(:description, :transaction_type, :amount, :voided)
  end
end
