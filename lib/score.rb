module Tenpin    
  class Score
    attr_reader :throws, :data

    def initialize
      @throws = []
      @data = []
      @total = 0
    end

    def to_arr
      @data
    end

    def add(pins)
      @throws << pins
    end
    alias << add
    
    def calculate(throw_index = 0, frame = 1)
      return 0 if frame > 10

      if strike?(throw_index)
        @total += 10 + strike_bonus(throw_index)
        @data << @total
        calculate(throw_index + 1, frame + 1)
      elsif spare?(throw_index)
        @total += 10 + spare_bonus(throw_index)
        @data << @total
        calculate(throw_index + 2, frame + 1)
      else
        @total += sum_throws_in_frame(throw_index)
        @data << @total
        calculate(throw_index + 2, frame + 1)
      end
      @total
    end

    def sum_throws_in_frame(throw_index)
      throw_at(throw_index) + throw_at(throw_index + 1)
    end

    def spare_bonus(throw_index)
      throw_at(throw_index + 2)
    end

    def strike_bonus(throw_index)
      throw_at(throw_index + 1) + throw_at(throw_index + 2)
    end

    def spare?(throw_index)
      sum_throws_in_frame(throw_index) == 10
    end

    def strike?(throw_index)
      throw_at(throw_index) == 10
    end

    def throw_at(index)
      throws[index] || 0
    end
  end
end