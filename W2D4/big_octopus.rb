# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
#
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish
# lengths to all other fish lengths

def sluggish_o(fishies)
  fishies.each_with_index do |fish1, idx1|
    longest = true
    fishies.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      longest = false if fish2.length > fish1.length
    end
    return fish1 if longest
  end
end

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting
# algorithm that runs in O(n log n) in the Sorting Demo. Remember that
# Big O is classified by the dominant term.
def dominant_o(fishies)
  merge_sort(fishies)
end

private

def merge_sort(fishies)
  return fishies if fishies.size < 2
  mid_idx = fishies.size/2

  left = dominant_o(fishies.take(mid_idx))
  right = dominant_o(fishies.drop(mid_idx))

  merge(left, right)
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when -1
    merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

  merged.concat(left)
  merged.concat(right)

  merged
end

public

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the
# longest fish that you have found so far while stepping through the array only once.

def clever_o(fishies)
  longest = fishies.first

  fishies.each do |fish|
    longest = fish if fish.length > longest.length
  end

  longest
end

# Full of fish, the Octopus attempts Dance Dance Revolution.
# The game has tiles in the following directions:
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding
# tentacle. We can assume that the octopus's eight tentacles are numbered
# and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the
# tentacle number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(dir, tiles)
  tiles.each_index do |idx|
    return idx if dir == tiles[idx]
  end
end

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster.
# Use a different data structure and write a new function so that you
# can access the tentacle number in O(1) time.

def constant_dance(dir, tiles)
  tiles[dir]
end

fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p clever_o(fishies)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up"]
tiles_hsh = { "up" => 1,
              "right-up" => 2,
              "right" => 3,
              "right-down" => 4,
              "down" => 5,
              "left-down" => 6,
              "left" => 7,
              "left-up" => 8
            }

p slow_dance('left', tiles_array)
p constant_dance('down', tiles_hsh)
