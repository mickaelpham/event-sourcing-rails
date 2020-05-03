# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::CountersController do
  let(:counter_id) { 1 }

  describe '#show' do
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
end
