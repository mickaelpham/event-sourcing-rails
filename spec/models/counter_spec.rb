# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Counter, type: :model do
  let(:counter) { described_class.find(1) }

  describe 'initialization' do
    it 'is sets to 0' do
      expect(counter.count).to eq(0)
    end
  end

  describe 'increment' do
    it 'increments the counter by the given number' do
      expect { counter.incr(2) }.to change(counter, :count).from(0).to(2)
    end
  end

  describe 'decrement' do
    it 'decrements the counter by the given number' do
      expect { counter.decr(3) }.to change(counter, :count).from(0).to(-3)
    end
  end

  describe 'reset' do
    before { counter.incr }

    it 'resets the counter to 0' do
      expect { counter.reset }.to change(counter, :count).from(1).to(0)
    end
  end

  describe 'stored events' do
    before do
      counter.incr(10)
      counter.decr(5)
    end

    it 'stores the events in the db' do
      expect(CounterEvent.count).to eq(2)
    end

    it 'applies the events when retrieving the counter' do
      expect(described_class.find(1).count).to eq(5)
    end
  end
end
