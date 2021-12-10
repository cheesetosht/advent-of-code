def read_input
   File.read("input.txt").split.map(&:to_i)
end

def part_one(arr)
   inc_cnt = 0
   (1..arr.length-1).each do |i|
      if arr[i] > arr[i-1]
         inc_cnt+=1
      end   
   end
   inc_cnt
end

def part_two(arr)
   window_sums = []
   rem = arr.length % 3
   (0..arr.length-rem - 1).each do |i|
      window_sums << arr[i] + arr[i+1] + arr[i+2]
   end
   part_one(window_sums)
end

puts part_one read_input
puts part_two read_input