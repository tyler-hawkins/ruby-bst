require_relative "tree"
require_relative "node"

data = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ]
puts "Creating binary search tree from an array of random numbers..."
tree = Tree.new(data)
puts "Tree:"
tree.pretty_print

puts "Root node: #{tree.root.data}" 

puts "Finding value \"6\" in the tree: #{tree.find(6) || "nil"}"

puts "Confirming that the tree is balanced..."
puts "Tree is balanced: " + tree.balanced?.to_s

puts "Printing out all elements in level order..."
tree.level_order { |node| print "#{node.data } " }
puts ""

puts "Printing out all elements in pre order..."
tree.preorder { |node| print "#{node.data } " }
puts ""

puts "Printing out all elements in post order..."
tree.postorder { |node| print "#{node.data } " }
puts ""

puts "Printing out all elements in order..."
tree.inorder { |node| print "#{node.data } " }
puts ""

puts "Unbalancing the tree by adding several elements > 100..."
10.times do
	tree.insert(rand(100..125))
end
tree.pretty_print

puts "Height of the tree: #{tree.height()}"

puts "Removing value \"4\" from the tree..."
tree.delete(4)
tree.pretty_print

puts "Confirming that the tree is unbalanced..."
puts "Tree is balanced: " + tree.balanced?.to_s

puts "Rebalancing the tree..."
tree.rebalance

puts "Rebalanced tree:"
tree.pretty_print

puts "Printing out all elements in level order..."
tree.level_order { |node| print "#{node.data } " }
puts ""

puts "Printing out all elements in pre order..."
tree.preorder { |node| print "#{node.data } " }
puts ""

puts "Printing out all elements in post order..."
tree.postorder { |node| print "#{node.data } " }
puts ""

puts "Printing out all elements in order..."
tree.inorder { |node| print "#{node.data } " }