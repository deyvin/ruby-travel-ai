# frozen_string_literal: true

require './app/entities/travel'
require './app/usecases/plan_travel'

class TravelController
  def self.plan(params)
    travel = Travel.new(
      start_date: params[:start_date],
      end_date: params[:end_date],
      origin: params[:origin],
      destination: params[:destination],
    )

    PlanTravel.new(travel: travel).call(params[:type])
  end
end