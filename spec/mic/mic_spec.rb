require 'spec_helper'

describe Mic do

  context 'when not asking for market segments' do

    it 'markets can be found by mic and market segments are not returned' do
      markets = Mic.where(mic: 'XTSE')
      expect(markets).to match_array([
                                       {mic: "XTSE", acronym: "TSX", market_name: "TORONTO STOCK EXCHANGE", market_type: "O", operating_mic: "XTSE", country_code: "CA", country_name: "CANADA", city: "TORONTO", website: "WWW.TSE.COM"}
                                     ])
    end

    it 'markets can be found by market_name and market segments are not returned' do
      markets = Mic.where(market_name: 'Toronto')
      expect(markets).to match_array([
                                       {mic: "XTSE", acronym: "TSX", market_name: "TORONTO STOCK EXCHANGE", market_type: "O", operating_mic: "XTSE", country_code: "CA", country_name: "CANADA", city: "TORONTO", website: "WWW.TSE.COM"}
                                     ])
    end

    it 'markets can be found by country_code and market segments are not returned' do
      markets = Mic.where(country_code: 'DK')
      expect(markets).to match_array([
                                       {mic: "DKTC", acronym: nil, market_name: "DANSK OTC", market_type: "O", operating_mic: "DKTC", country_code: "DK", country_name: "DENMARK", city: "HORSENS", website: "WWW.DANSKOTC.DK"},
                                       {mic: "GXGR", acronym: "DANSK AMP", market_name: "GXG MARKETS A/S", market_type: "O", operating_mic: "GXGR", country_code: "DK", country_name: "DENMARK", city: "HORSENS", website: "WWW.GXGMARKETS.COM"},
                                       {mic: "NPGA", acronym: nil, market_name: "NORD POOL GAS A/S", market_type: "O", operating_mic: "NPGA", country_code: "DK", country_name: "DENMARK", city: "COPENHAGEN", website: "WWW.NORDPOOLGAS.COM"},
                                       {mic: "XCSE", acronym: nil, market_name: "OMX NORDIC EXCHANGE COPENHAGEN A/S", market_type: "O", operating_mic: "XCSE", country_code: "DK", country_name: "DENMARK", city: "COPENHAGEN", website: "WWW.OMXNORDICEXCHANGE.COM"}
                                     ])
    end

    it 'markets can be found by operating_mic and market segments are not returned' do
      markets = Mic.where(operating_mic: 'XNAS')
      expect(markets).to match_array([
                                       {mic: "XNAS", acronym: "NASDAQ", market_name: "NASDAQ - ALL MARKETS", market_type: "O", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQ.COM"}
                                     ])
    end

  end

  context 'when asking for market segments' do

    it 'markets can be found by operating_mic and market segments are returned' do
      markets = Mic.where(operating_mic: 'XNAS', include_segments: true)
      expect(markets).to match_array([
                                       {mic: "XNAS", acronym: "NASDAQ", market_name: "NASDAQ - ALL MARKETS", market_type: "O", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQ.COM"},
                                       {mic: "BOSD", acronym: "NQBXDARK", market_name: "NASDAQ OMX BX DARK", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQOMXTRADER.COM"},
                                       {mic: "ESPD", acronym: "ESPEED", market_name: "NASDAQ OMX ESPEED", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQOMX.COM"},
                                       {mic: "NASD", acronym: "NSDQDARK", market_name: "NSDQ DARK", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQ.COM"},
                                       {mic: "XBOS", acronym: "BSE", market_name: "NASDAQ OMX BX", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQOMXTRADER.COM"},
                                       {mic: "XBRT", acronym: "BRUT", market_name: "BRUT ECN", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQTRADER.COM"},
                                       {mic: "XBXO", acronym: nil, market_name: "NASDAQ OMX BX OPTIONS", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQOMXTRADER.COM"},
                                       {mic: "XNCM", acronym: nil, market_name: "NASDAQ CAPITAL MARKET", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQ.COM"},
                                       {mic: "XNDQ", acronym: nil, market_name: "NASDAQ OPTIONS MARKET", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQ.COM"},
                                       {mic: "XNGS", acronym: "NGS", market_name: "NASDAQ/NGS (GLOBAL SELECT MARKET)", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQ.COM"},
                                       {mic: "XNIM", acronym: nil, market_name: "NASDAQ INTERMARKET", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQ.COM"},
                                       {mic: "XNMS", acronym: nil, market_name: "NASDAQ/NMS (GLOBAL MARKET)", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQ.COM"},
                                       {mic: "XPBT", acronym: "NFX", market_name: "NASDAQ OMX FUTURES EXCHANGE", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "PHILADELPHIA", website: "WWW.NASDAQTRADER.COM"},
                                       {mic: "XPHL", acronym: "PHLX", market_name: "NASDAQ OMX PHLX", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "PHILADELPHIA", website: "WWW.PHLX.COM"},
                                       {mic: "XPHO", acronym: nil, market_name: "PHILADELPHIA OPTIONS EXCHANGE", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "PHILADELPHIA", website: "WWW.PHLX.COM"},
                                       {mic: "XPOR", acronym: nil, market_name: "PORTAL", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "WASHINGTON", website: "WWW.NASDAQPORTALMARKET.COM"},
                                       {mic: "XPSX", acronym: "PSX", market_name: "NASDAQ OMX PSX", market_type: "S", operating_mic: "XNAS", country_code: "US", country_name: "UNITED STATES OF AMERICA", city: "NEW YORK", website: "WWW.NASDAQTRADER.COM"}
                                     ])
    end

    it 'markets can be found by country_code and market segments are not returned' do
      markets = Mic.where(country_code: 'DK', include_segments: true)
      expect(markets).to match_array([
                                       {mic: "DKTC", acronym: nil, market_name: "DANSK OTC", market_type: "O", operating_mic: "DKTC", country_code: "DK", country_name: "DENMARK", city: "HORSENS", website: "WWW.DANSKOTC.DK"},
                                       {mic: "GXGR", acronym: "DANSK AMP", market_name: "GXG MARKETS A/S", market_type: "O", operating_mic: "GXGR", country_code: "DK", country_name: "DENMARK", city: "HORSENS", website: "WWW.GXGMARKETS.COM"},
                                       {mic: "GXGF", acronym: nil, market_name: "GXG MTF FIRST QUOTE", market_type: "S", operating_mic: "GXGR", country_code: "DK", country_name: "DENMARK", city: "HORSENS", website: "WWW.GXGMARKETS.COM"},
                                       {mic: "GXGM", acronym: nil, market_name: "GXG MTF", market_type: "S", operating_mic: "GXGR", country_code: "DK", country_name: "DENMARK", city: "HORSENS", website: "WWW.GXGMARKETS.COM"},
                                       {mic: "NPGA", acronym: nil, market_name: "NORD POOL GAS A/S", market_type: "O", operating_mic: "NPGA", country_code: "DK", country_name: "DENMARK", city: "COPENHAGEN", website: "WWW.NORDPOOLGAS.COM"},
                                       {mic: "XCSE", acronym: nil, market_name: "OMX NORDIC EXCHANGE COPENHAGEN A/S", market_type: "O", operating_mic: "XCSE", country_code: "DK", country_name: "DENMARK", city: "COPENHAGEN", website: "WWW.OMXNORDICEXCHANGE.COM"},
                                       {mic: "XFND", acronym: nil, market_name: "FIRST NORTH DENMARK", market_type: "S", operating_mic: "XCSE", country_code: "DK", country_name: "DENMARK", city: "COPENHAGEN", website: "WWW.OMXNORDICEXCHANGE.COM"}
                                     ])
    end

  end

end
