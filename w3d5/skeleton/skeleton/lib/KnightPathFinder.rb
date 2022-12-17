require_relative '00_tree_node'
require 'Set' 
require 'byebug'
class KnightPathFinder
    # @@root_node = nil
    #refactor this later
    def self.valid_moves(pos)
        x,y = pos
        chess_size = 8 #8x8 chessboard
        valid_moves = []
        #can move up/down 2 spaces vertically + 1 space horizontally
        #or can move up/down 1 space vertically + 2 spaces horizontally

        (-2..2).each do |i|
            2.downto(-2).each do |j|
                if i.abs != j.abs and i != 0 and j != 0
                    new_x = x+i
                    new_y = y+j
                    if new_x >= 0 and new_x < 8 and new_y >= 0 and new_y < 8
                        valid_moves << [new_x, new_y]
                    end
                end
            end
        end

        valid_moves

        # top_left_moves = [[x-2, y+1], [x-1, y+2]]
        # top_right_moves = [[x+2,y+1], [x+1, y+2]]
        # bottom_left_moves = [[x-2,y-1], [x-1,y-2]]
        # bottom_right_moves = [[x+2,y-1],[x+1,y-2]]

        # valid_moves + top_left_moves + 
        # top_right_moves + bottom_left_moves + bottom_right_moves
    end

    def initialize(pos)
        @pos = pos
        @considered_positions = Set.new([pos])
        @root_node = nil
    end

    def pos
        @pos
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos)
        new_positions = []
        new_moves.each do |new_pos|
            unless @considered_positions.include?(new_pos)
                new_positions << new_pos
            end
        end
        @considered_positions += new_moves
        new_positions
    end

    #expected return: an array of nodes
    def build_move_tree
        starting_pos = pos
        self.root_node = PolyTreeNode.new(starting_pos)
        queue = [self.root_node]
        until queue.empty?
            node = queue.shift
            node_position = node.value
            new_moves = new_move_positions(node_position)
            new_moves.each do |new_move|
                new_move_node = PolyTreeNode.new(new_move)
                node.add_child(new_move_node)
                queue.push(new_move_node)
            end
            new_move_positions(node_position)
        end
        #self
        p @considered_positions.length
    end

    def find_path(end_pos)

    end

    attr_accessor :root_node
end