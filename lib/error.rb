module Tenpin
  class Error
    class << self
      def max_rolls_exceeded
        puts "\nError: the amount of rolls permitted have been exceeded".red
        exit(false)
      end
    end
  end
end