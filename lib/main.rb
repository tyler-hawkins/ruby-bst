require_relative "tree"
require_relative "node"

data = [1, 2, 3, 5, 6, 7, 8, 9]
puts "Creating binary search tree from an array of random numbers..."
tree = Tree.new(data)
puts "Tree:"
tree.pretty_print

puts "Root node: #{tree.root.data}" 

puts "Confirming that the tree is balanced..."
puts "Tree is balanced: " + tree.balanced?.to_s

puts "Printing out all elements in level order..."
tree.level_order { |node| print node.value }

puts "Printing out all elements in pre order..."

puts "Printing out all elements in post order..."

puts "Printing out all elements in order..."

puts "Unbalancing the tree by adding several elements > 100..."
tree.insert(4)
tree.pretty_print

puts "Removing value \"4\" from the tree..."
tree.delete(4)
tree.pretty_print

puts "Confirming that the tree is unbalanced..."

puts "Rebalancing the tree..."

puts "Printing out all elements in level order..."

puts "Printing out all elements in pre order..."

puts "Printing out all elements in post order..."

puts "Printing out all elements in order..."