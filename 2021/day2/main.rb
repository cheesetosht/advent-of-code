class Command
   attr_reader :direction, :magnitude

   def initialize(command)
      @direction = command.split[0]
      @magnitude = command.split[1].to_i
   end
end

def read_input
   File.read("input.txt").split("\n").map {|itr| Command.new(itr)}
end

def part_one(commands)
   x = 0
   y = 0

   for cmd in commands
      case cmd.direction
      when "forward"
         x += cmd.magnitude
      when "up"
         y -= cmd.magnitude
      when "down"
         y += cmd.magnitude      
      else
         puts "IDK"
      end
   end

   x * y
end

def part_two(commands)
   x = 0
   y = 0
   aim = 0

   for cmd in commands
      case cmd.direction
      when "forward"
         x += cmd.magnitude
         y += aim * cmd.magnitude
      when "up"
         aim -= cmd.magnitude
      when "down"
         aim += cmd.magnitude
      else
         puts "IDK"
      end
   end

   x * y
end

puts part_one read_input
puts part_two read_input