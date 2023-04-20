# frozen_string_literal: true

require './lib/travel'

class TravelController
  def self.plan(params)
    PlanTravelFactory.new(params).perform!
  end
end