# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account do
  describe 'balance' do
    subject { account.balance }

    let(:account) { described_class.new }

    context 'with a new account' do
      it { is_expected.to eq(0) }
    end

    context 'with prior transactions' do
      before do
        account.deposit(100)
        account.withdraw(30)
      end

      it { is_expected.to eq(70) }
    end
  end
end
