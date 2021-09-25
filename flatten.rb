require "benchmark"

a1 = [[1,2],[[3,4],5],[6,7]]

def gen_random_array(length = rand(1...9))
    Array.new(length) { rand(1...9) }
end

def gen_nested_array(length = rand(1...9), level = 5)
    arr = gen_random_array(length)
    if level > 0
        tmp = arr.map { |length| gen_random_array(length) }
        tmp = tmp.map { |el| gen_nested_array(el, level - 1) }
        tmp
    else
        arr
    end
end

# Time complexity n^m (m is deep level)
def recursive_flatten(arr)
    ret = []
    arr.each do |el|
        if el.is_a? Array
            ret += recursive_flatten(el)
        else
            ret << el
        end
    end
    ret
end

def regex_flatten(arr)
    arr.to_s # This turns the array into: "[[1,2,[3]],4]"
      .gsub(/[\[|\]]/, "") # Remove those brackets, so it's now: "1,2,3,4"
      .split(", ") # Now rejoin into a single array: ["1","2","3","4"]
      .map(&:to_i) # Convert all items in array back to integers: [1,2,3,4]
end


Benchmark.bm do |x|
    base_level = 0
    max_level = 5
    base_length = 10
    max_level.times do |index|
        cur_level = base_level + (index + 1)
        arr = gen_nested_array(base_length, cur_level)
        puts "L#{cur_level}"
        x.report("built-in") {
            arr.flatten
        }
        x.report("recursive") {
            recursive_flatten(arr)
        }
        x.report("regex") {
            regex_flatten(arr)
        }
    end
    
end