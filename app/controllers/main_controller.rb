class MainController < ApplicationController
  def index
    @summaries = FinancialTransaction.select("sum(amount) as amount, transaction_type").where(voided: false).group('transaction_type').map{|v| {v.transaction_type => v.amount}}.reduce(:merge)
    @summaries = (@summaries.blank? ? {} : @summaries)
    respond_to do |format|
      format.html { render :index }
      format.js {}
    end
  end

  def debit
    @transactions = FinancialTransaction.where("transaction_type= 'Debit' and voided= 'f'")

    respond_to do |format|
      format.html { render :index }
      format.js {}
    end
  end

  def credit
    @transactions = FinancialTransaction.where("transaction_type= 'Credit' and voided= 'f'")

    respond_to do |format|
      format.html { render :index }
      format.js {}
    end
  end

  def summary
    @summaries = FinancialTransaction.select("sum(amount) as amount, transaction_type").where(voided: false).group('transaction_type').map{|v| {v.transaction_type => v.amount}}.reduce(:merge)
    @summaries = (@summaries.blank? ? {} : @summaries)
    respond_to do |format|
      format.html { render :index }
      format.js {}
    end
  end

end
