# frozen_string_literal: true

module API
  class TransactionsController < ApplicationController
    def index
      render json: TransactionSerializer.new(account.transactions)
    end

    def create
      type   = transaction_params[:type]
      amount = transaction_params[:amount]

      case type
      when 'deposit'  then account.deposit(amount)
      when 'withdraw' then account.withdraw(amount)
      end

      render json: TransactionSerializer.new(account.transactions.last)
    end

    private

    def account
      @account ||= Account.find(params[:account_id])
    end

    def transaction_params
      params.require(:data).require(:attributes).permit(:type, :amount)
    end
  end
end
