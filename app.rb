require 'sinatra'
require 'byebug'
require 'dotenv'
Dotenv.load

require './app/controllers/travel_controller'

post '/plan' do
  {result: TravelController.plan(params) }.to_json
end