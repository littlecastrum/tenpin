module Tenpin
  class Parser
    class << self
      def file_to_players(file_path)
        path = File.absolute_path(file_path)
        players = Hash.new

        File.open(path, "r").each_line do |line|
          data = line.split(" ")
          name, pinfall = data
          validate_pinfall(pinfall.to_i)
          if players[name].nil? then players[name] = Player.new(name) end
          players[name] << pinfall
        end

        players.values.each do |player|
          player.calc_score
          validate_game(player)
        end

        return players.values
      end

      private

      def validate_game(player)
        if !player.game_ended?
          Error.frames_missing
        elsif player.current_frame > 10
          Error.frame_limit_exceeded
        end
      end

      def validate_pinfall(pinfall)
        if pinfall > 10 || pinfall < 0
          Error.invalid_score
        end
      end

    end
  end
end