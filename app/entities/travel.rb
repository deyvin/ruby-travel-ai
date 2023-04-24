# frozen_string_literal: true

class Travel
  
  attr_accessor :start_date, :end_date, :origin, :destination

  def initialize(start_date:, end_date:, origin:, destination:)
    @start_date = start_date
    @end_date = end_date
    @origin = origin
    @destination = destination
  end
end
