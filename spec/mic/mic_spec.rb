require 'spec_helper'

describe Mic do

  context 'when not asking for market segments' do

    it 'markets can be found by mic' do
      markets = Mic.where(mic: 'XTSE')
      expect(markets).to match_array([
        {mic: "XTSE", operating_mic: "XTSE", market_type: "OPRT", market_name: "TORONTO STOCK EXCHANGE", acronym: "TSX", country_code: "CA", city: "TORONTO", website: "WWW.TSE.COM"},
      ])
    end

    it 'markets can be found by market_name' do
      markets = Mic.where(market_name: 'Toronto')
      expect(markets.map { |m| m[:mic] }).to include("XTSE")
      expect(markets).to all(include(market_type: "OPRT"))
    end

    it 'markets can be found by country_code' do
      markets = Mic.where(country_code: 'DK')
      expect(markets).to all(include(market_type: "OPRT", country_code: "DK"))
      expect(markets.map { |m| m[:mic] }).to include("DKTC", "XCSE", "NPGA")
    end

    it 'markets can be found by operating_mic' do
      markets = Mic.where(operating_mic: 'XNAS')
      expect(markets).to match_array([
        {mic: "XNAS", operating_mic: "XNAS", market_type: "OPRT", market_name: "NASDAQ - ALL MARKETS", acronym: "NASDAQ", country_code: "US", city: "NEW YORK", website: "WWW.NASDAQ.COM"},
      ])
    end

  end

  context 'when asking for market segments' do

    it 'markets can be found by operating_mic and market segments are returned' do
      markets = Mic.where(operating_mic: 'XNAS', include_segments: true)
      oprt = markets.select { |m| m[:market_type] == "OPRT" }
      sgmt = markets.select { |m| m[:market_type] == "SGMT" }
      expect(oprt.size).to eq(1)
      expect(oprt.first[:mic]).to eq("XNAS")
      expect(sgmt.size).to be >= 15
      expect(sgmt.map { |m| m[:mic] }).to include("BOSD", "NASD", "XBOS", "XNGS", "XPHL")
    end

    it 'markets can be found by country_code and market segments are returned' do
      markets = Mic.where(country_code: 'DK', include_segments: true)
      oprt = markets.select { |m| m[:market_type] == "OPRT" }
      sgmt = markets.select { |m| m[:market_type] == "SGMT" }
      expect(oprt.size).to be >= 4
      expect(sgmt.size).to be >= 1
      expect(sgmt.map { |m| m[:mic] }).to include("GXGM")
    end

  end

end
