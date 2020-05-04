# frozen_string_literal: true

class AccountEvent < ApplicationRecord
  TRANSACTION_TYPES = %w[
    deposit
    withdraw
  ].freeze
end
