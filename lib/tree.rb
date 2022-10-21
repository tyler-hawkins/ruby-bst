# The tree class should have a root attribute which uses the return value of #build_tree
# The tree class should accept an array when initialized
class Tree
	attr_accessor :root

	def initialize(arr = [])
		@root = build_tree(arr)
	end

	def build_tree(arr)
		# Sort array

		# Remove duplicates from array

		# Turn array into a balanced binary tree full of 
		# node objects that are appropriately placed

		# Return the level-0 root node
	end

	def insert(value)
		# Insert the value as a node to the end of the 
		# list (or in the sorted place?)
	end

	def delete(value)
		# Find the node with this value

		# Remove the node

		# If the node has children, (left or right) delete 
		# those nodes and their children as well
	end

	def find(value)
		# Return the node with this value
	end

	def level_order(&blk)
		# Traverse the tree in breadth-first level order and
		# yield each node to the block
		# Root -> Left/Right -> Left/Right -> etc

		# Implement using iteration and/or recursion

		# Return an array of values if no block is given
	end

	# This collection of 3 methods accepts a block and traverses the 
	# tree in their respective depth-first order and yields each node
	# to the provided block
	# The methods should return an array of values if no block is given
	def inorder(&blk)
		# Traverse the tree from the leftmost node and work your way 
		# to the right, moving to a node's right child before going up
		# Left -> Root -> Right
	end

	def preorder(&blk)
		# Traverse the tree from the root node, and work your way through
		# the left subtree, then the right subtree
		# Root -> Left -> Right
	end

	def postorder(&blk)
		# Traverse the tree from the leftmost node, moving right to cover the
		# entire left subtree, then repeat for the right subtree, finally
		# visiting the root node
		# Left -> Right -> Root
	end

	def height(node)		
		# Height is defined as the number of edges in the
		# longest path from a given node to a leaf node

		# Return the height of the given node		
	end

	def depth(node)
		# Depth is defined as the number of edges in a path
		# from a given node to the tree's root node

		# Return the depth of the given node
	end

	def balanced?()
		# Checks if the tree is balanced

		# A balanced tree is one where the difference between 
		# heights of left subtree and right subtree of every node 
		# is not more than 1
	end

	def rebalance()
		# Balance an unbalanced tree
	end
end