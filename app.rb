require 'sinatra'
require 'byebug'
require './lib/travel'

post '/plan' do
  result = Travel
    .new
    .with_dates(params[:start_date], params[:end_date])
    .from(params[:city_origin])
    .to(params[:city_destination])
    .plan!(params[:type])
    
  {result: result }.to_json
end