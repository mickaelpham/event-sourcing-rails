# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account do
  let(:account_id) { 1 }
  let(:account) { described_class.find(account_id) }

  describe 'balance' do
    subject { account.balance }

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

  describe 'withdraw' do
    subject(:withdrawal) { account.withdraw(amount) }

    context 'when the amount is more than the existing balance' do
      let(:amount) { 1 }

      it 'raises an error' do
        expect { withdrawal }
          .to raise_error(Account::BalanceLessThanWithdrawalAmount)
      end
    end

    context 'when the amount is less than the existing balance' do
      before { account.deposit(100) }

      let(:amount) { 25 }

      it 'changes the balance accordingly' do
        expect { withdrawal }.to change(account, :balance).from(100).to(75)
      end

      it 'stores the event' do
        expect { withdrawal }.to change(AccountEvent, :count).by(1)
      end
    end
  end

  describe 'deposit' do
    subject(:deposit) { account.deposit(amount) }

    context 'when the amount is 0' do
      let(:amount) { 0 }

      it 'raises an error' do
        expect { deposit }.to raise_error(Account::NegativeAmountDeposit)
      end
    end

    context 'when the amount is negative' do
      let(:amount) { -100 }

      it 'raises an error' do
        expect { deposit }.to raise_error(Account::NegativeAmountDeposit)
      end
    end

    context 'when the amount is positive' do
      let(:amount) { 20 }

      it 'changes the balance accordingly' do
        expect { deposit }.to change(account, :balance).from(0).to(20)
      end

      it 'stores the event' do
        expect { deposit }.to change(AccountEvent, :count).by(1)
      end
    end
  end
end
