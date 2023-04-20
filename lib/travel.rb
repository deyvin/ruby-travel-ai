# frozen_string_literal: true

require './lib/services/open_ai_service'
require './lib/utils/prompt_util'

class Travel
  TYPES = %i[travel_itinerary weather violence_info best_way].freeze

  def initialize(start_date:, end_date:, origin:, destination:)
    @start_date = start_date
    @end_date = end_date
    @origin = origin
    @destination = destination
  end

  def plan!(type)
    raise 'Type not found' unless TYPES.include?(type.to_sym)

    send(type)
  end

  private

  def travel_itinerary
    prompt = Utils::Prompt.itinerary_text(@destination, @start_date, @end_date)
    OpenAiService.new.call(prompt)
  end

  def weather
    prompt = Utils::Prompt.weather_text(@start_date, @destination)
    OpenAiService.new.call(prompt)
  end

  def violence_info
    prompt = Utils::Prompt.violence_text(@destination)
    OpenAiService.new.call(prompt)
  end

  def best_way
    prompt = Utils::Prompt.best_way_text(@origin, @destination)
    OpenAiService.new.call(prompt)
  end
end
