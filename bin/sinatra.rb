require 'json'
require 'sinatra'
require_relative '../lib/radix_tree/radix_tree'

DICTIONARY_PATH = 'db/dictionary.txt'

set :port, 8080

def load_dictionary(radix_tree)
  begin
    radix_tree.load_from_file(DICTIONARY_PATH)
  rescue
    puts 'unable to load dictionary'
  end
end

configure do
  radix_tree = RadixTree::RadixTreeStorage.new
  load_dictionary(radix_tree)
  set :radix_tree, radix_tree
end

get '/' do
  'Please use add, find or contains command!'
end

get '/add?:word' do
  content_type :json
  word = params.keys.first

  options.radix_tree.add(word)
end

get '/contains?:word' do
  content_type :json
  word = params.keys.first

  {result: options.radix_tree.contains(word)}.to_json
end

get '/find?:word' do
  content_type :json
  word = params.keys.first

  words = options.radix_tree.find(word)
  {words: words}.to_json
end