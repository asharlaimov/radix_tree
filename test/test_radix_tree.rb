require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'
require 'minitest/unit'
require '../lib/radix_tree'
require 'simplecov'
SimpleCov.start

class RadixTreeTest < Minitest::Test

  def test_add
    tree = RadixTree.new
    tree.add 'hello'
    assert_equal true, tree.contains('hello')
    assert_equal false, tree.contains('hell')
    assert_equal false, tree.contains('')
    assert_equal false, tree.contains('hello1')
  end

  def test_add_two_items
    tree = RadixTree.new
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
    tree = RadixTree.new
    tree.add 'home'
    tree.add 'homepage'
    assert_equal [], tree.find('')
    assert_equal [], tree.find('h')
    assert_equal [], tree.find('ho')
    assert_equal ['homepage', 'home'], tree.find('hom')
  end
end