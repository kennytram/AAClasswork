a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']

 #sluggish octopus O(n^2)
 def sluggish_octopus(arr)
    largest_fish = ""
    for fish1 in arr
        for fish2 in arr
            fish = (fish1.length < fish2.length) ? fish2 : fish1
            largest_fish = (largest_fish.length < fish.length) ? fish : largest_fish
        end
    end
    largest_fish
 end
 p sluggish_octopus(a)
 p a.max {|b| b.length}
 p sluggish_octopus(a) == a.max {|b| b.length}

 #Dominant Octopus O(n lg n)
 #TIL ruby uses quick_sort as sort method
def dominant_octopus(arr)

    def merge(l, r)
        res = []
        until l.empty? or r.empty?
            if l[0].length < r[0].length
                res << l.shift
            else
                res << r.shift
            end
        end
        res + l + r
    end

    return arr if arr.length < 2
    mid = arr.length / 2
    left = dominant_octopus(arr[0...mid])
    right = dominant_octopus(arr[mid..-1])
    merge(left, right)
end
p dominant_octopus(a)[-1]

#clever octopus O(n)
def clever_octopus(arr)
    res = ""
    for fish in arr
        res = fish if fish.length > res.length
    end
    res
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
    "left",  "left-up" ]

#Dancing Octopus O(n)
def slow_dance(dir, arr)
    for i in 0...arr.length
        return i if arr[i] == dir
    end
    nil
end
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)


new_tiles_data_structure = 
{
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

#Constant Dance!
def fast_dance(dir, hash)
    hash[dir]
end

p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)