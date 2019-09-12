require "tenpin/version"
require 'thor'

module Tenpin
  class CLI < Thor
    desc "parse FILE_PATH", "Scoreboard printed to console from file parse"
    def parse(file_path)
      puts file_path
    end
  end
end
