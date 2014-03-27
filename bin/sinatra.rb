require 'json'
require 'sinatra'
require_relative '../lib/radix_tree/radix_tree'

set :port, 8080

configure do
  RADIX_TREE = RadixTree::RadixTree.new
  RADIX_TREE.load_from_file('db/dictionary.txt')
end

get '/' do
  'Hello world!'
end

get '/add?:word' do
  content_type :json
  word = params.keys.first

  RADIX_TREE.add(word)
end

get '/contains?:word' do
  content_type :json
  word = params.keys.first

  {result: RADIX_TREE.contains(word)}.to_json
end

get '/find?:word' do
  content_type :json
  word = params.keys.first

  words = RADIX_TREE.find(word)
  {words: words}.to_json
end