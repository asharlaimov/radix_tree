require_relative 'version'
require 'zip'

module RadixTree
  class RadixTreeStorage
    MAX_DEPTH = 100

    private
    attr_accessor :root

    public
    def initialize
      @root = TrieNode.new
    end

    def add(word)
      v = root
      word.each_char do |char|
        unless v.children.has_key?(char)
          v.children[char] = TrieNode.new
        end
        v = v.children[char]
      end
      v.leaf = true
    end

    def contains(word)
      found, vertex = read word
      found && vertex.leaf # v.leaf because of exact match
    end

    def find(starts_with)
      result = []
      return result if starts_with.length < 3

      found, vertex = read starts_with

      if found
        read_all_words(vertex, result, starts_with)
      end

      result
    end

    def get_all_words
      result = []
      read_all_words(root, result)
      result
    end

    private
    def read_all_words(vertex, result_list, s = '', depth = 0)
      return if depth > MAX_DEPTH
      vertex.children.each { |k, v| read_all_words(v, result_list, s + k, depth + 1) }
      if vertex.leaf
        result_list << s
      end
    end

    # read word and return [find result, last vertex]
    def read(word)
      v = root
      word.each_char do |char|
        unless v.children.has_key?(char)
          return [false, v]
        end
        v = v.children[char]
      end

      [true, v]
    end

    public
    def save_to_file(file_name)
      words = get_all_words
      File.open(file_name, 'w+') do |f|
        f.truncate(0) #Delete all the content from file
        words.each { |word| f.puts(word) }
      end
    end

    def load_from_file(file_name)
      words = []
      File.open(file_name).each do |line|
        words << line
      end

      words.each { |word| add(word.chomp) }
    end

    def save_to_zip(zip_file_name, file_name_in_zip = 'words.txt')
      words = get_all_words
      File.delete(zip_file_name) if File.exist?(zip_file_name)
      Zip::File.open(zip_file_name, Zip::File::CREATE) do |zip_file|
        zip_file.get_output_stream(file_name_in_zip) do |os|
          words.each { |word| os.puts(word) }
        end
      end
    end

    def load_from_zip(file_name)
      Zip::File.open(file_name) do |zip_file|
        entry = zip_file.glob('*.txt').first
        words = entry.get_input_stream.readlines
        words.each { |word| add(word.chomp) }
      end
    end
  end

  class TrieNode
    attr_accessor :leaf, :children

    def initialize
      @children = {}
      @leaf = false
    end
  end
end