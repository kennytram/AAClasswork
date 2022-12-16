require_relative '00_tree_node'
require 'Set' 
class KnightPathFinder
    #refactor this later
    def self.valid_moves(pos)
        x,y = pos
        valid_moves = []
        #can move up/down 2 spaces vertically + 1 space horizontally
        #or can move up/down 1 space vertically + 2 spaces horizontally

        top_left_moves = [[x-2, y+1], [x-1, y+2]]
        top_right_moves = [[x+2,y+1], [x+1, y+2]]
        bottom_left_moves = [[x-2,y-1], [x-1,y-2]]
        bottom_right_moves = [[x+2,y-1],[x+1,y-2]]

        valid_moves + top_left_moves + 
        top_right_moves + bottom_left_moves + bottom_right_moves
    end

    def initialize(pos)
        @pos = pos
        @considered_positions = Set.new([pos])
        @root_node = PolyTreeNode.new(pos)
    end

    def pos
        @pos
    end

    def new_move_positions(pos)
        @considered_positions + (KnightPathFinder.valid_moves(pos))
        build_move_tree
    end

    #expected return: an array of nodes
    def build_move_tree
        
    end
end