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

    get_all_words(v, starts_with, result)
    result
  end

  def get_all
    result = []
    get_all_words(root, '', result)
    result
  end

  private
  def get_all_words(vertex, s = '', result_list)
    vertex.children.each { |k, v| get_all_words(v, s+k, result_list) }
    if vertex.leaf
      result_list << s
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