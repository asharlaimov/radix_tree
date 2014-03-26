require_relative '../lib/radix_tree/radix_tree'

tree = RadixTree::RadixTree.new
tree.add 'hello'
tree.add 'world'
tree.add 'home'
tree.add 'homework'
tree.add 'homepage'
tree.add 'hi'

#tree.find('hom').each { |world| puts world }

puts '__'
tree.get_all_words.each { |world| puts world }

tree.save_to_file('d:/words123.txt')
#tree.save_to_zip('d:/words123.zip')

tree2 = RadixTree::RadixTree.new
tree2.load_from_file('d:/words123.txt')
#tree2.load_from_zip('d:/words123.zip')

puts '__'
tree2.get_all_words.each { |world| puts world }