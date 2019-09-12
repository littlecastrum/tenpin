module Tenpin
  class Table
    def initialize players
      @players = players
      @table = build
    end

    def print
      @table
    end
    alias inspect print
    
    private

    def build
      return Terminal::Table.new do |t|
        frames = ['Frames']
        10.times { |frame| frames << frame + 1 }
        t << frames
        t << :separator
        for player in @players do
          name = [player.name.blue]
          10.times { |frame| name << ''}
          t << name
          t << pinfalls_formatter(player.pinfalls)
          t << player.score.to_arr.unshift('Score'.yellow)
          t << :separator
        end
        t.title = "Ten Pin Bowling Game Scores".blue
        t.style = { :padding_left => 2, :padding_right => 2, :border_bottom => false, :border_x => "=", :border_i => "|" }
        10.times { |column| t.align_column(column + 1, :center) }
      end
    end

    def pinfalls_formatter(pinfalls)
      result = pinfalls.map do |frame, idx|
        first, second, third = frame
        frame_sum = first.to_i + second.to_i
        is_ten = ->(val) { val.to_i == 10 ? 'X' : val }
        first = is_ten[first]
        third = is_ten[third]
        second = second_throw_formatter(second, frame_sum)
        [first, second, third].reduce('') { |frame, pins| pins.nil? ? frame : "#{frame} #{pins}"}
      end
      result.unshift('Pinfalls')
    end

    def second_throw_formatter(pin, frame_sum)
      if frame_sum == 10 && !pin.nil?
        '/'
      elsif pin.to_i == 10
        'X'
      else
        pin
      end
    end
  end
end