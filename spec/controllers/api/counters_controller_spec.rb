# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::CountersController do
  let(:counter_id) { 1 }

  describe 'show' do
    context 'when then counter has no events' do
      it 'returns a counter initialized to 0' do
        get(:show, params: { id: counter_id })

        expect(response.body).to eq('0')
      end
    end

    context 'when the counter has events' do
      before do
        counter = Counter.find(counter_id)
        2.times { counter.incr }
      end

      it 'returns the counter current value' do
        get(:show, params: { id: counter_id })

        expect(response.body).to eq('2')
      end
    end
  end

  describe 'reset' do
    before { Counter.find(counter_id).incr(5) }

    it 'resets the counter to 0' do
      delete(:destroy, params: { id: counter_id })

      expect(response.body).to eq('0')
    end
  end

  describe 'update' do
    context 'with incr cmd' do
      it 'returns the incremented value' do
        put(:update, params: { id: counter_id, cmd: 'incr', by: 3 })

        expect(response.body).to eq('3')
      end
    end

    context 'with decr cmd' do
      it 'returns the decremented value' do
        put(:update, params: { id: counter_id, cmd: 'decr', by: 3 })

        expect(response.body).to eq('-3')
      end
    end

    context 'with an invalid cmd' do
      before { put(:update, params: { id: counter_id, cmd: 'invalid-cmd' }) }

      it 'returns 422' do
        expect(response.status).to eq(422) # unprocessable entity
      end

      it 'returns the invalid cmd' do
        expect(response.body).to eq("I don't know this command: invalid-cmd")
      end
    end
  end
end
