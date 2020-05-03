# frozen_string_literal: true

module API
  class AccountSerializer
    include FastJsonapi::ObjectSerializer
    attributes :balance
  end
end
