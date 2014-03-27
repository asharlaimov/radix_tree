require 'sinatra'

class App < Sinatra::Base

end

get '/' do
  'Hello world!'
end

get '/add?:word' do
  word = params[:word]

  word
end