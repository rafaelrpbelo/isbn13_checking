class ISBN13
  PRIMARY_MULTIPLIER    = 1
  SECONDARY_MULTIPLIER  = 3
  NUMBER_LENGTH         = 12

  class InvalidNumberFormat < Exception; end

  class << self
    def calculate(number)

      validate_input_format!(number)

      # Append the end digit to number
      "#{number}#{get_end_digit(number)}"
    end

    private

    # Take each digit, from left to right and multiply them alternatively by 1 and 3
    # and sum those numbers
    def sum_digits_with_multiplier(number)
      multiplier = PRIMARY_MULTIPLIER

      number.each_char.reduce(0) do |acc, char, a|
        n = Integer(char)

        acc       += n * multiplier
        multiplier = alternate_multiplier(multiplier)

        acc
      end
    end

    def alternate_multiplier(current_multiplier)
      current_multiplier == PRIMARY_MULTIPLIER ?
        SECONDARY_MULTIPLIER :
        PRIMARY_MULTIPLIER
    end

    def get_end_digit(number)
      sum = sum_digits_with_multiplier(number)

      # Take mod 10 of the summed figure
      digit = sum % 10

      # Subtract 10 and if the end number is 10, make it 0
      10 - digit
    end

    def validate_input_format!(number)
      raise InvalidNumberFormat, "only numbers must be given" unless number =~ /\d+/

      unless number.length == NUMBER_LENGTH
        raise InvalidNumberFormat, "incorrect length"
      end
    end
  end
end
