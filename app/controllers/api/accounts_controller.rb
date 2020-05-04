# frozen_string_literal: true

module API
  class AccountsController < ApplicationController
    def show
      render json: AccountSerializer.new(account)
    end

    private

    def account
      @account ||= Account.find(params['id'])
    end
  end
end
