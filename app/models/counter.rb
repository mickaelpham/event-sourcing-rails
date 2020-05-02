# frozen_string_literal: true

class Counter
  def self.find(id)
    instance = new(id)

    CounterEvent.where(model_id: id).find_each do |event|
      instance.send("apply_#{event.name.underscore}", event.data)
    end

    instance
  end

  attr_accessor :id, :count

  def initialize(id)
    @id = id
    @count = 0
  end

  def incr(num = 1)
    exec('increment', num)
  end

  def decr(num = 1)
    exec('decrement', num)
  end

  def reset
    exec('reset')
  end

  def exec(cmd, params = nil)
    event = send("handle_#{cmd}", params).merge('model_id' => id)
    CounterEvent.create(event)
    send("apply_#{event['name'].underscore}", event['data'])
    self
  end

  def apply_incremented(data)
    @count += data['by']
  end

  def apply_decremented(data)
    @count -= data['by']
  end

  def apply_reset(_data)
    @count = 0
  end

  def handle_increment(num)
    raise unless num.is_a? Integer

    { 'name' => 'Incremented', 'data' => { 'by' => num } }
  end

  def handle_decrement(num)
    raise unless num.is_a? Integer

    { 'name' => 'Decremented', 'data' => { 'by' => num } }
  end

  def handle_reset(_)
    { 'name' => 'Reset', 'data' => {} }
  end
end
