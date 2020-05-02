# frozen_string_literal: true

class CreateSubscriptionEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_events do |t|
      t.integer :model_id, index: true, null: false
      t.string :name, null: false
      t.json :data, null: false
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
