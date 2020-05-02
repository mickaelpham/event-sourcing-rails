# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Counter, type: :model do
  let(:counter) { Counter.find(1) }

  context 'initialization' do
    it 'is sets to 0' do
      expect(counter.count).to eq 0
    end
  end

  context 'increment' do
    it 'increments the counter by the given number' do
      expect { counter.incr(2) }.to change(counter, :count).from(0).to 2
    end
  end

  context 'decrement' do
    it 'decrements the counter by the given number' do
      expect { counter.decr(3) }.to change(counter, :count).from(0).to(-3)
    end
  end

  context 'reset' do
    before { counter.incr }

    it 'resets the counter to 0' do
      expect { counter.reset }.to change(counter, :count).from(1).to(0)
    end
  end
end
