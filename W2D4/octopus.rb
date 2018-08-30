fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_octopus(array)
  fish_hash = Hash.new(0)


  array.each_with_index do |el, idx|
    longest_fish = true

    array.each_with_index do |el2, idx2|
      next if idx == idx2
      longest_fish = false if el2.length > el.length
    end

    return el if longest_fish
  end
end

class Array
  def merge_sort(&prc)
    return self if length <= 1

    prc ||= Proc.new { |x, y| x <=> y }

    mid = length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when - 1 || 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)
    merged
  end
end

def dominant_octopus(fishes)
  prc = proc {|x, y| y.length <=> x.length}
  fishes.merge_sort(&prc).first
end

def genius_fish(array)
  biggest_fish = array.first

  array.each do |el|
    if el > biggest_fish
      biggest_fish = el
    end
  end
  biggest_fish
end

tiles = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

tiles = {
  "up" => 0,
  "right-up" => 1,
  "right"=> 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, tiles)
  tiles[direction]
end
