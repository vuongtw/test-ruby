def gen_strings(max_string = 100, max_chars = 10)
    Array.new(max_string) { 
        (0...rand(0...max_chars)).map { ('a'..'z').to_a[rand(26)] }.join
    }.join(" ")
end

def find_longest_string(strs)
    strs.split(" ").max_by(&:length)
end

strs = gen_strings(10, 100)

puts "ALL:"
puts strs.split(" ")

puts "LONGEST:"
puts find_longest_string(strs)