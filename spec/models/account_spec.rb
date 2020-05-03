# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account do
  let(:account_id) { 1 }

  describe 'balance' do
    subject { account.balance }

    let(:account) { described_class.find(account_id) }

    context 'with a new account' do
      it { is_expected.to eq(0) }
    end

    context 'with prior transactions' do
      before do
        account.deposit(100)
        account.withdraw(30)
      end

      it { is_expected.to eq(70) }

      it 'applies stored events on find' do
        other = described_class.find(account_id)

        expect(other.balance).to eq(account.balance)
      end
    end
  end
end
