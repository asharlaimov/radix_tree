require 'drb/drb'
require_relative '../lib/radix_tree/radix_tree'

# The URI for the server to connect to
SERVER_URI = "druby://localhost:8787"

DICTIONARY_PATH = 'db/dictionary.txt'

class RadixTreeServer
  private
  attr_accessor :radix_tree

  public
  def initialize
    @radix_tree = RadixTree::RadixTreeStorage.new
  end

  def load_dictionary(path)
    begin
      @radix_tree.load_from_file(path)
    rescue
      puts 'unable to load dictionary'
    end
  end

  def add(word)
    @radix_tree.add(word)
  end

  def find(word)
    @radix_tree.find(word)
  end

  def contains(word)
    @radix_tree.contains(word)
  end
end

# The object that handles requests on the server
FRONT_OBJECT = RadixTreeServer.new
FRONT_OBJECT.load_dictionary DICTIONARY_PATH

$SAFE = 1 # disable eval() and friends

DRb.start_service(SERVER_URI, FRONT_OBJECT)

# Wait for the drb server thread to finish before exiting.
DRb.thread.join