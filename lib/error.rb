module Tenpin
  class Error
    class << self
      def invalid_score
        puts "\nError: invalid score value".red
        exit(false)
      end

      def frame_limit_exceeded
        puts "\nError: only 10 frames per player are permited".red
        exit(false)
      end

      def frames_missing
        puts "\nError: game have missing frames".red
        exit(false)
      end

      def max_rolls_exceeded
        puts "\nError: the amount of rolls permitted have been exceeded".red
        exit(false)
      end
    end
  end
end