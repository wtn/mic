require 'csv'

module Mic

  class Search

    def initialize
      @a = []
      CSV.foreach(file, headers: true) do |row|
        h = {}
        h[:mic] = row["MIC"]
        h[:operating_mic] = row["OPERATING MIC"]
        h[:market_type] = row["OPRT/SGMT"]
        h[:market_name] = row["MARKET NAME-INSTITUTION DESCRIPTION"]
        h[:acronym] = row["ACRONYM"]
        h[:country_code] = row["ISO COUNTRY CODE (ISO 3166)"]
        h[:city] = row["CITY"]
        h[:website] = row["WEBSITE"]
        @a << h
      end
    end

    def select_by(symbol, string, include_segments)
      @a = @a.select{ |m| m[:market_type] == 'OPRT' } unless include_segments
      @a.select{ |m| m[symbol] =~ Regexp.new(string, Regexp::IGNORECASE) }
    end

    def file
      File.expand_path("../../files/ISO10383.csv", __dir__)
    end

  end

end
