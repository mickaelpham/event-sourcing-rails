# frozen_string_literal: true

class Account
  attr_reader :id, :balance

  class BalanceLessThanWithdrawalAmount < StandardError; end
  class NegativeAmountDeposit < StandardError; end

  class << self
    def find(id)
      account = new(id)

      AccountEvent.where(model_id: id)
                  .find_each { |event| account.apply(event) }

      account
    end
  end

  def initialize(id)
    @id = id
    @balance = 0
  end

  def withdraw(amount)
    exec(:withdraw, amount)
  end

  def deposit(amount)
    exec(:deposit, amount)
  end

  def exec(cmd, data)
    event = send("handle_#{cmd}", data).merge('model_id' => id)
    AccountEvent.create(event)
    apply(event)
    self
  end

  def apply(event)
    send("apply_#{event['name'].underscore}", event['data'])
  end

  def handle_withdraw(amount)
    unless amount.is_a?(Integer) && amount <= balance
      raise BalanceLessThanWithdrawalAmount
    end

    { 'name' => 'Withdrew', 'data' => { 'amount' => amount } }
  end

  def handle_deposit(amount)
    unless amount.is_a?(Integer) && amount.positive?
      raise Account::NegativeAmountDeposit
    end

    { 'name' => 'Deposited', 'data' => { 'amount' => amount } }
  end

  def apply_withdrew(data)
    @balance -= data.fetch('amount')
  end

  def apply_deposited(data)
    @balance += data.fetch('amount')
  end
end
