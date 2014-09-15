require 'sinatra'
require_relative 'lib/dur'

include Dur

get '/ping' do
  [200, 'Hello']
end

get '/' do
  erb :index
end

post '/' do
  duration = params[:duration]
  if /\d/.match duration
    seconds = word_time_to_seconds duration
    @duration = seconds
    @converted_duration = seconds_to_iso8601 seconds
  end
  erb :index
end

# Server config
configure do
  set :port, ENV['PORT']
end
