require '../lib/radix_tree'

puts 'Started'
tree = RadixTree.new
tree.add 'hello'
tree.add 'world'
tree.add 'home'
tree.add 'homework'
tree.add 'homepage'
tree.add 'hi'

puts tree.contains('hello')
puts tree.contains('worldwide')
puts tree.contains('home')
puts tree.contains('hill')
puts '__2'

tree.find('hom').each { |world| puts world }

puts '__'
tree.get_all.each { |world| puts world }

puts 'Ended'