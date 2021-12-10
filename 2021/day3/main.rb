def read_input
   File.read("input.txt").split
end

def part_one(numbers)
   most_common_bits = ""
   least_common_bits = ""

   for index in (0..numbers[0].length-1)
       zero_count = 0
       one_count = 0
       for number in numbers
           digits = number.split("")
           if(digits[index].to_i == 1)
               one_count += 1
           else
               zero_count += 1
            end
         end   
            if(one_count > zero_count)
               most_common_bits << "1"
               least_common_bits << "0"
            else
               least_common_bits << "1"
               most_common_bits << "0"
            end
   end
   most_common_bits.to_i(2)  * least_common_bits.to_i(2)
end

def part_two(numbers)

   most_common_array = numbers.clone
   least_common_array = numbers.clone

   for index in (0..most_common_array[0].length-1)
      mc = get_most_common(index,most_common_array)
      # print "mca got #{most_common_array} before filter"
      # puts
      # puts "#{mc} @ #{index}"
      most_common_array.select! {|num| num[index] == mc}
      # print "mca got #{most_common_array}"
      # puts
      if most_common_array.length==1
         break
      end
   end

   for index in (0..least_common_array[0].length-1)
      lc = get_least_common(index,least_common_array)
      print "lca got #{least_common_array} before filter"
      puts
      puts "#{lc} @ #{index}"
      least_common_array.select! {|num| num[index] == lc}
      print "lca got #{least_common_array}"
      puts
      if least_common_array.length==1
         break
      end
   end
   print least_common_array

   most_common_array[0].to_i(2) * least_common_array[0].to_i(2)
end

def get_most_common(idx,arr)
   zeros = 0
   ones = 0

   for itr in arr
      if itr[idx] == '1' 
         ones += 1
      else
         zeros += 1
      end
   end
   if(ones>=zeros)
      "1"
   else
      "0"
   end
end

def get_least_common(idx,arr)
   zeros = 0
   ones = 0

   for itr in arr
      if itr[idx] == '1' 
         ones += 1
      else
         zeros += 1
      end
   end
   if(zeros<=ones)
      "0"
   else
      "1"
   end
end

puts part_one read_input
puts part_two read_input