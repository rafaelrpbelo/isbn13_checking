class ISBN13
  PRIMARY_MULTIPLIER    = 1
  SECONDARY_MULTIPLIER  = 3

  def self.check(number)
    # Append the digit to number
    "#{number}#{get_end_digit(number)}"
  end

  private

  # Take each digit, from left to right and multiply them alternatively by 1 and 3
  # and sum those numbers
  def self.sum_digits_with_multiplier(number)
    multiplier = PRIMARY_MULTIPLIER

    number.each_char.reduce(0) do |acc, char, a|
      n = Integer(char)

      acc       += n * multiplier
      multiplier = alternate_multiplier(multiplier)

      acc
    end
  end

  def self.alternate_multiplier(current_multiplier)
    current_multiplier == PRIMARY_MULTIPLIER ?
      SECONDARY_MULTIPLIER :
      PRIMARY_MULTIPLIER
  end

  def self.get_end_digit(number)
    sum = sum_digits_with_multiplier(number)

    # Take mod 10 of the summed figure
    digit = sum % 10

    # Subtract 10 and if the end number is 10, make it 0
    10 - digit
  end
end
