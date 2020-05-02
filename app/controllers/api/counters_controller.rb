class API::CountersController < ApplicationController
  def show
    render plain: counter.count.to_s
  end

  def update
    cmd = params.fetch('cmd')
    by  = params['by']

    case cmd
    when 'incr' then by ? counter.incr(by) : counter.incr
    when 'decr' then by ? counter.decr(by) : counter.decr
    else
      render :unprocessable_entity, "I don't know this command: #{cmd}"
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
