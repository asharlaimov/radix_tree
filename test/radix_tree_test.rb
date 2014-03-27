require 'test_helper'
require_relative '../lib/radix_tree/radix_tree'

class RadixTreeTest < Minitest::Test

  def test_add
    tree = RadixTree::RadixTreeStorage.new
    tree.add 'hello'

    assert_equal true, tree.contains('hello')
    assert_equal false, tree.contains('hell')
    assert_equal false, tree.contains('')
    assert_equal false, tree.contains('hello1')
  end

  def test_add_two_items
    tree = RadixTree::RadixTreeStorage.new
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
    tree = RadixTree::RadixTreeStorage.new
    tree.add 'home'
    tree.add 'homepage'

    assert_equal [], tree.find('')
    assert_equal [], tree.find('h')
    assert_equal [], tree.find('ho')
    assert_equal ['homepage', 'home'], tree.find('hom')
  end

  def test_get_all
    tree = RadixTree::RadixTreeStorage.new
    tree.add 'home'
    tree.add 'homepage'
    tree.add 'homework'
    tree.add 'sun'
    tree.add 'day'
    tree.add 'sunday'

    assert_equal ['home', 'homepage', 'homework', 'sun', 'day', 'sunday'].sort, tree.get_all_words.sort
  end

  def test_load_from_file
    tree = RadixTree::RadixTreeStorage.new

    File.stub(:open, ['hello', 'h']) do
      tree.load_from_file('')
    end

    assert_equal ['hello', 'h'], tree.get_all_words
  end

  def test_save_to_file
    tree = RadixTree::RadixTreeStorage.new
    tree.add 'home'

    mock = Minitest::Mock.new
    mock.expect(:truncate, nil, [0])
    mock.expect(:puts, nil, ['home'])

    File.stub(:open, nil, mock) do
      tree.save_to_file('')
    end

    assert_equal ['home'], tree.get_all_words
  end
end