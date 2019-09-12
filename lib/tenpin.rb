require "tenpin/version"
require 'terminal-table'
require 'colorize'
require 'thor'

require 'error'
require 'player'
require 'table'
require 'parser'
require 'pinfalls'
require 'score'

module Tenpin
  class CLI < Thor
    desc "parse FILE_PATH", "Scoreboard printed to console from file parse"
    def parse(file_path)
      file_path = File.absolute_path(file_path)
      players = Parser.file_to_players(file_path)
      table = Table.new(players)
      p table
    end
  end
end
