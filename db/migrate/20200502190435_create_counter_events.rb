class CreateCounterEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :counter_events do |t|
      t.integer :model_id, index: true, null: false
      t.string :name, null: false
      t.json :data, null: false
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
