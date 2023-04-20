# frozen_string_literal: true

require './app/use_cases/plan_travel_user_case'
require './lib/utils/prompt_util'
require './app/infrastructure/external_apis/openai_api'


class PlanTravelFactory
  def initialize(params)
    @params = params
  end

  def perform!
    PlanTravelUseCase.new.initialize(travel, prompt, openai_api)
  end

  private
  def travel
    Travel
      .new(@params[:start_date], @params[:end_date], @params[:origin], @params[:destination])
  end

  def prompt
    new Utils::Prompt
  end

  def openai_api
    new OpenAiApi
  end
end