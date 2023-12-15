# lines = File.readlines("../inputs/4/example_input.txt").map(&:strip)
lines = File.readlines("../inputs/4/input.txt").map(&:strip)

sum = lines.sum do |line|
  winning_numbers, my_numbers = line.split(": ")[1].split(" | ").map do |numbers_string|
    numbers_string.split(" ")
  end

  my_numbers.reduce(0) do |points, my_number|
    next points unless winning_numbers.include?(my_number)

    (points == 0) ? points + 1 : points * 2
  end
end

puts sum
