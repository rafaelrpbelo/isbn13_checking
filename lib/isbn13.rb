class ISBN13
  def self.check(number)
    multiplier = 1

    # Take each digit, from left to right and multiply them alternatively by 1 and 3
    sum = number.each_char.reduce(0) do |acc, char, a|
      n = Integer(char)

      # Sum those numbers
      acc       += n * multiplier
      multiplier = multiplier == 1 ? 3 : 1

      acc
    end

    # Take mod 10 of the summed figure
    digit = sum % 10

    # Subtract 10 and if the end number is 10, make it 0
    digit = 10 - digit

    # Append the digit to number
    "#{number}#{digit}"
  end
end
