require_relative 'version'
require 'zip'

module RadixTree

  class RadixTree

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
      v = root
      word.each_char do |char|
        unless v.children.has_key?(char)
          return false
        end
        v = v.children[char]
      end

      v.leaf ? true : false
    end

    def find(starts_with)
      return [] if starts_with.length < 3
      result = []
      v = root
      starts_with.each_char do |char|
        unless v.children.has_key?(char)
          return result
        end
        v = v.children[char]
      end

      read_all_words(v, starts_with, result)
      result
    end

    def get_all_words
      result = []
      read_all_words(root, '', result)
      result
    end

    private
    def read_all_words(vertex, s = '', result_list)
      vertex.children.each { |k, v| read_all_words(v, s+k, result_list) }
      if vertex.leaf
        result_list << s
      end
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