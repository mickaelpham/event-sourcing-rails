# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::TransactionsController do
  let(:account) { Account.find(1) }

  describe 'index' do
    context 'when there are no transactions' do
      it 'returns an empty JSON:API collection' do
        get(:index, params: { account_id: account.id })
        want = { data: [] }.to_json

        expect(response.body).to eq(want)
      end
    end

    context 'when there are transactions' do
      before do
        account.deposit(100)
        account.withdraw(20)
      end

      let(:want) do
        {
          data: [
            {
              type: 'transaction',
              id: account.transactions.first.id.to_s,
              attributes: {
                type: 'deposit',
                amount: 100
              }
            },
            {
              type: 'transaction',
              id: account.transactions.last.id.to_s,
              attributes: {
                type: 'withdrawal',
                amount: 20
              }
            }
          ]
        }
      end

      it 'returns the transactions as a JSON:API collection' do
        get(:index, params: { account_id: account.id })

        expect(JSON.parse(response.body, symbolize_names: true)).to match(want)
      end
    end
  end

  describe 'create' do
    subject(:post_transaction) do
      post(:create, params: transaction_params.merge(account_id: account.id))
    end

    context 'when the transaction is valid' do
      let(:transaction_params) do
        {
          data: {
            type: 'transaction',
            attributes: {
              type: 'deposit',
              amount: 10
            }
          }
        }
      end

      it 'returns 201 created' do
        post_transaction

        expect(response.status).to eq(201)
      end

      it 'stores the transaction' do
        expect { post_transaction }.to change(account.transactions, :size).by(1)
      end
    end

    context 'when the transaction type is invalid' do
      let(:transaction_params) do
        {
          data: {
            type: 'transaction',
            attributes: {
              type: 'invalid-operation',
              amount: 1
            }
          }
        }
      end

      let(:err) do
        {
          title: 'Invalid Transaction Type',
          detail: 'invalid-operation is not supported'
        }
      end

      it 'returns 422 unprocessable entity' do
        post_transaction

        expect(response.status).to eq(422)
      end

      it 'prints the error details' do
        post_transaction

        expect(JSON.parse(response.body, symbolize_names: true)).to match(err)
      end
    end

    context 'when the amount cannot be withdrawn' do
      let(:amount) { 10 }

      let(:transaction_params) do
        {
          data: {
            type: 'transaction',
            attributes: {
              type: 'withdraw',
              amount: amount
            }
          }
        }
      end

      let(:err) do
        {
          title: 'Insufficient Balance',
          detail: "Cannot withdraw $#{amount} from account"
        }
      end

      it 'returns 422 unprocessable entity' do
        post_transaction

        expect(response.status).to eq(422)
      end

      it 'prints the error details' do
        post_transaction

        expect(JSON.parse(response.body, symbolize_names: true)).to match(err)
      end
    end

    context 'when the amount cannot be deposited' do
      let(:amount) { -1 }

      let(:transaction_params) do
        {
          data: {
            type: 'transaction',
            attributes: {
              type: 'deposit',
              amount: amount
            }
          }
        }
      end

      let(:err) do
        {
          title: 'Invalid Deposit Amount',
          detail: "Cannot deposit #{amount}"
        }
      end

      it 'returns 422 unprocessable entity' do
        post_transaction

        expect(response.status).to eq(422)
      end

      it 'prints the error details' do
        post_transaction

        expect(JSON.parse(response.body, symbolize_names: true)).to match(err)
      end
    end
  end
end
