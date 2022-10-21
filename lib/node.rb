# The node class shouuld have an attribute for the data it stores, 
# as well as its left and right children nodes

class Node
	attr_accessor :data, :left, :right

	def initialize(data = nil)
		@data = data
		@left = nil
		@right = nil
	end
end