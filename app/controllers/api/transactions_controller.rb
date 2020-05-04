# frozen_string_literal: true

module API
  class TransactionsController < ApplicationController
    before_action :ensure_valid_transaction_type, only: :create

    rescue_from Account::BalanceLessThanWithdrawalAmount,
                with: :render_insufficient_balance

    rescue_from Account::NegativeAmountDeposit,
                with: :render_invalid_deposit

    def index
      render json: TransactionSerializer.new(account.transactions)
    end

    def create
      type   = transaction_params[:type]
      amount = transaction_params[:amount].to_i

      case type
      when 'deposit'  then account.deposit(amount)
      when 'withdraw' then account.withdraw(amount)
      end

      render json: TransactionSerializer.new(account.transactions.last),
             status: :created
    end

    private

    def account
      @account ||= Account.find(params[:account_id])
    end

    def transaction_params
      params.require(:data).require(:attributes).permit(:type, :amount)
    end

    def ensure_valid_transaction_type
      type = transaction_params[:type]
      return if AccountEvent::TRANSACTION_TYPES.include?(type)

      error = {
        title: 'Invalid Transaction Type',
        detail: "#{type} is not supported"
      }

      render json: error, status: :unprocessable_entity
    end

    def render_insufficient_balance
      error = {
        title: 'Insufficient Balance',
        detail: "Cannot withdraw $#{transaction_params[:amount]} from account"
      }

      render json: error, status: :unprocessable_entity
    end

    def render_invalid_deposit
      error = {
        title: 'Invalid Deposit Amount',
        detail: "Cannot deposit #{transaction_params[:amount]}"
      }

      render json: error, status: :unprocessable_entity
    end
  end
end
