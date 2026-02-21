require 'csv'

module Mic

  class Search

    def initialize
      @a = []
      CSV.foreach(file) do |row|
        h = {}
        h[:mic] = row[2]
        h[:acronym] = row[6]
        h[:market_name] = row[5]
        h[:market_type] = row[4]
        h[:operating_mic] = row[3]
        h[:country_code] = row[1]
        h[:country_name] = row[0]
        h[:city] = row[7]
        h[:website] = row[8]
        @a << h
      end
    end

    def select_by(symbol, string, include_segments)
      @a = @a.select{ |m| m[:market_type] == 'O' } unless include_segments
      @a.select{ |m| m[symbol] =~ Regexp.new(string, Regexp::IGNORECASE) }
    end

    def file
      File.expand_path("../../files/ISO10383.csv", __dir__)
    end

  end

end
