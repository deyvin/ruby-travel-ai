# frozen_string_literal: true

require './lib/utils/prompt_util'
require './app/infra/external_apis/openai_api'

class PlanTravel

  TYPES = %i[travel_itinerary weather violence_info best_way].freeze

  def initialize(
    travel:, 
    prompt: Utils::Prompt,
    openai_api: OpenAiApi.new
  )
    @travel = travel
    @prompt = prompt
    @openai_api = openai_api
    self
  end

  def call(type)
    raise 'Type not found' unless TYPES.include?(type.to_sym)
    
    send(type)
  end

  private

  def travel_itinerary
    prompt = @prompt.itinerary_text(@travel.destination, @travel.start_date, @travel.end_date)
    @openai_api.call(prompt)
  end

  def weather
    prompt = @prompt.weather_text(@travel.start_date, @travel.destination)
    @openai_api.call(prompt)
  end

  def violence_info
    prompt = @prompt.violence_text(@travel.destination)
    @openai_api.call(prompt)
  end

  def best_way
    prompt = @prompt.best_way_text(@travel.origin, @travel.destination)
    @openai_api.call(prompt)
  end
end