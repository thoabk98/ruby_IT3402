def fizz_buzz(max)
    arr = []
    (1..max).each do |n|
      if ((n % 3 == 0) && (n % 5 == 0))
        arr << "FizzBuzz"
      elsif (n % 3 == 0)
        arr << "Fizz"
      elsif (n % 5 == 0)
        arr << "Buzz"
      else
        arr << n
      end
    end
    return arr
  end
  input = ARGV[0].to_i
  a = fizz_buzz(input)
  puts a