# The tree class should have a root attribute which uses the return value of 
# build_tree
# The tree class should accept an array when initialized
class Tree
	attr_accessor :root

	def initialize(arr = [])		
		# Sort array
		arr.sort!
		# Remove duplicates from array
		arr.uniq!
		puts "Sorted array with duplicates removed: #{arr}"
		@root = build_tree(arr)
	end

	# Turn array into a balanced binary tree full of node objects that are 
	# appropriately placed
	def build_tree(arr)
		# If the given array can't be split any further, create and return a 
		# node with that value
		if arr.length <= 1 then
			return Node.new(arr[0])
		end

		# Get the midpoint of the array => [1, 2, *3*, 4, 5]
		mid_index = (arr.length / 2).round
		# Create the root node with this value => *3*
		root = Node.new(arr[mid_index])
		# Build this node's left subtree by grabbing everything before the root 
		# node => [*1, 2*, 3, 4, 5]
		root.left = build_tree(arr[0..mid_index - 1])
		# Build this node's right subtree by grabbing everything after the root 
		# node => [1, 2, 3, *4, 5*]
		# It is possible (e.g. [1, >2<]) for a root node to not have a right 
		# subtree, since the array is big enough only for a left tree.
		# In this case, we return nil, and this node only has a left subtree.
		root.right = arr.length - mid_index > 1 ? build_tree(arr[mid_index + 1..arr.length - 1]) : nil

		# Return the root node
		# When the recursion catches up, this will eventually be the 
		# level-0 root node of the entire tree.
		return root
	end

	def insert(value, node = @root)
		# Insert the value in sorted place, do not allow for duplicate values
		if value == node.data then
			return
		end
	    if value < node.data
			node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
		else
			node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
		end
	end

	def delete(value, node = @root)
		if value == node.data then
			return
		end

		# Find the node with this value
		if value < node.data
			node.left = delete(value, node.left)
		elsif value > node.data
			node.right = delete(value, node.right)
		else
			# If the node has children, (left or right) delete those nodes and their
			# children as well
			if node.left.nil? then
				temp = node.right
				node = nil
				return temp
			elsif node.right.nil? then
				temp = node.right
				node = nil
				return temp
			end

			# Remove the node	
			temp = min_node(node.right)
			node.data = temp.data
			node.right = delete(temp.data, node.right)
		end
		return node
	end

	def find(value, node = @root)
		# Return the node with this value
		return if node.nil?
		return node if node.data == value
		return find(value, node.right) if value > node.data
		return find(value, node.left) if value < node.data 
	end

	def level_order(node = @root)
		return if node.nil?
		# Traverse the tree in breadth-first level order and yield each node to
		# the block
		# Root -> Left -> Root -> Right -> etc		
		# Implement using iteration and/or recursion
		output = []
		queue = []
		queue.push(node)
		until queue.empty?
			current = queue.shift
			output.push(block_given? ? yield(current) : current.data)
			queue.push(current.left) if current.left
			queue.push(current.right) if current.right
		end
		# Return an array of values if no block is given
		output
	end

	# This collection of 3 methods accepts a block and traverses the tree in 
	# their respective depth-first order and yields each node to the provided
	# block
	# The methods should return an array of values if no block is given, 
	# e.g. do nothing to the node, just add its data to the output array
	def inorder(node = @root, output = [], &blk)
		# Traverse the tree from the leftmost node and work your way to the 
		# right, moving to a node's right child before going up
		# Left -> Root -> Right
		return if node.nil? 

		inorder(node.left, output, &blk)
		output.push(block_given? ? blk.call(node) : node.data)
		inorder(node.right, output, &blk)
	
		output	

	end

	def preorder(node = @root, output = [], &blk)
		# Traverse the tree from the root node, and work your way through the 
		# left subtree, then the right subtree
		# Root -> Left -> Right
		return if node.nil? 

		output.push(block_given? ? blk.call(node) : node.data)
		preorder(node.left, output, &blk)
		preorder(node.right, output, &blk)
	
		output	
	end

	def postorder(node = @root, output = [], &blk)
		# Traverse the tree from the leftmost node, moving right to cover the
		# entire left subtree, then repeat for the right subtree, finally
		# visiting the root node
		# Left -> Right -> Root
		return if node.nil? 

		postorder(node.left, output, &blk)
		postorder(node.right, output, &blk)
		output.push(block_given? ? blk.call(node) : node.data)
	
		output	
	end

	def height(node = @root, num = -1)		
		# Height is defined as the number of edges in the longest path from a 
		# given node to a leaf node

		# Return the height of the given node		
		return num if node.nil?

		num += 1
		# .max since node could have only one child leaf, making that side +1 longer
		# than the other side
		[height(node.left, num), height(node.right, num)].max
	end

	def depth(node)
		# Depth is defined as the number of edges in a path from a given node
		# to the tree's root node

		# Return the depth of the given node
	end

	def balanced?()
		# Checks if the tree is balanced

		# A balanced tree is one where the difference between heights of left 
		# subtree and right subtree of every node is not more than 1
		# Start at the root of the tree
		# Get the height of the left tree and right tree, and compare them
		left = height(@root.left, 0)
		right = height(@root.right, 0)
		return (left - right).abs() <= 1
	end

	def rebalance()
		# Balance an unbalanced tree
		# Get all the nodes in level order and build the tree with that array
		nodes = inorder()
		@root = build_tree(nodes)
	end

	def min_node(node)
		node = node.left until node.left.nil?
		return node
	end

	def pretty_print(node = @root, prefix = '', is_left = true)
		pretty_print(node.right, "#{prefix}#{is_left ? '???   ' : '    '}", false) if node.right
		puts "#{prefix}#{is_left ? '????????? ' : '????????? '}#{node.data}"
		pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '???   '}", true) if node.left
	end
end