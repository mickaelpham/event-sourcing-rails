# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::AccountsController do
  let(:account_id) { 1 }

  describe 'show' do
    context 'when the account has no events' do
      before { get(:show, params: { id: account_id }) }

      let(:want) do
        {
          data: {
            id: account_id.to_s,
            type: 'account',
            attributes: {
              balance: 0
            }
          }
        }.to_json
      end

      it 'returns an empty balance' do
        expect(response.body).to match(want)
      end

      it 'returns a JSON:API object' do
        expect(response.content_type).to match(%r{application/vnd\.api\+json})
      end
    end

    context 'when the account has prior events' do
      before do
        account.deposit(1_000)
        account.withdraw(25)
      end

      let(:account) { Account.find(account_id) }

      it 'returns the current balance' do
        get(:show, params: { id: account_id })
        body = JSON.parse(response.body)

        expect(body.dig('data', 'attributes', 'balance')).to eq(975)
      end
    end
  end
end
