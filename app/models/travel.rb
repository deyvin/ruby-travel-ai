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
end
