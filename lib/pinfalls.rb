module Tenpin
  class Pinfalls
    def initialize
      @data = [[]]
    end

    def mark(pinfall)
      validate_mark
      @data[-1] << pinfall
      add_frame
    end
    alias << mark

    def to_arr
      @data
    end
    
    def flatten
      @data.flatten
    end

    def map(&block)
      result = []
      @data.each.with_index do |element, idx|
        result << block.call([element, idx + 1])
      end
      result
    end

    def last_frame?
      frame == 10
    end

    def frame
      @data.length
    end
    
    private

    def validate_mark
      if last_frame? && current_frame_data.length == 3 then Error.max_rolls_exceeded end
    end
    
    def current_frame_data
      @data[-1].map(&:to_i)
    end

    def all_pins_down
      current_frame_data.sum == 10
    end

    def add_frame
      if next_frame? then @data.push([]) end
    end

    def next_frame?
      !last_frame? && frame_ended?
    end

    def frame_ended?
      current_frame_data.length == 2 || all_pins_down
    end
  end
end