require 'minitest/unit'
require 'minitest/autorun'
require_relative '../lib/radix_tree/radix_tree'

class RadixTreeTest < MiniTest::Unit::TestCase

def test_add
  tree = RadixTree::RadixTree.new
  tree.add 'hello'
    assert_equal true, tree.contains('hello')
    assert_equal false, tree.contains('hell')
    assert_equal false, tree.contains('')
    assert_equal false, tree.contains('hello1')
  end

  def test_add_two_items
    tree = RadixTree::RadixTree.new
    tree.add 'homework'
    tree.add 'homepage'
    assert_equal true, tree.contains('homework')
    assert_equal true, tree.contains('homepage')
    assert_equal false, tree.contains('home')
    assert_equal false, tree.contains('work')
    assert_equal ['homework', 'homepage'], tree.find('hom')
    assert_equal ['homework', 'homepage'], tree.find('home')
    assert_equal ['homework'], tree.find('homew')
  end

  def test_find_min
    tree = RadixTree::RadixTree.new
    tree.add 'home'
    tree.add 'homepage'
    assert_equal [], tree.find('')
    assert_equal [], tree.find('h')
    assert_equal [], tree.find('ho')
    assert_equal ['homepage', 'home'], tree.find('hom')
  end
end