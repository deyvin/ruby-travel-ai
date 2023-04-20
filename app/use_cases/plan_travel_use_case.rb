# frozen_string_literal: true

class PlanTravelUseCase
  def initialize(travel, prompt, openai_api)
    @travel = travel
    @prompt = prompt
    @openai_api = openai_api
    self
  end

  def plan!(type)
    raise 'Type not found' unless TYPES.include?(type.to_sym)

    send(type)
  end

  private

  def travel_itinerary
    prompt = @prompt.itinerary_text(@destination, @start_date, @end_date)
    @openai_api.call(prompt)
  end

  def weather
    prompt = @prompt.weather_text(@start_date, @destination)
    @openai_api.call(prompt)
  end

  def violence_info
    prompt = @prompt.violence_text(@destination)
    @openai_api.call(prompt)
  end

  def best_way
    prompt = @prompt.best_way_text(@origin, @destination)
    @openai_api.call(prompt)
  end
end