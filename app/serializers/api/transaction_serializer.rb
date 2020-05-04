# frozen_string_literal: true

module API
  class TransactionSerializer
    include FastJsonapi::ObjectSerializer

    attribute :type do |object|
      case object.name
      when 'Deposited' then 'deposit'
      when 'Withdrew' then 'withdrawal'
      end
    end

    attribute :amount do |object|
      object.data['amount']
    end
  end
end
