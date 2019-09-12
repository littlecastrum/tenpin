module Tenpin
  class Player
    attr_reader :pinfalls, :score
    attr_accessor :name

    def initialize(name)
      @name = name
      @pinfalls = Pinfalls.new
      @score = Score.new
    end

    def throw(pins)
      @pinfalls << pins
      @score << pins.to_i
    end
    alias << throw

    def game_ended?
      @pinfalls.to_arr[-1].length >= 2 && @pinfalls.last_frame?
    end

    def current_frame
      @pinfalls.frame
    end

    def calc_score
      @score.calculate
    end
  end
end