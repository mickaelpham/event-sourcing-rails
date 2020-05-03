# frozen_string_literal: true

module API
  class CountersController < ApplicationController
    def show
      render plain: counter.count.to_s
    end

    def update
      by = params['by']

      case (cmd = params.fetch('cmd'))
      when 'incr' then counter.incr(by)
      when 'decr' then counter.decr(by)
      else
        render status: :unprocessable_entity,
               plain: "I don't know this command: #{cmd}"
        return
      end

      render plain: counter.count.to_s
    end

    def destroy
      counter.reset
      render plain: counter.count.to_s
    end

    private

    def counter
      @counter ||= Counter.find(params['id'])
    end
  end
end
