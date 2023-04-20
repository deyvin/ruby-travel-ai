# frozen_string_literal: true

require './lib/travel'

class TravelController
  def self.plan(params)
    Travel
      .new
      .with_dates(params[:start_date], params[:end_date])
      .from(params[:city_origin])
      .to(params[:city_destination])
      .plan!(params[:type])
  end
end