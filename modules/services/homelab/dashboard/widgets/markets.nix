{
  type = "markets";
  hide-header = true;
  chart-link-template = "https://www.tradingview.com/chart/?symbol={SYMBOL}";
  symbol-link-template = "https://www.google.com/search?tbm=nws&q={SYMBOL}";
  markets = [
    {
      symbol = "SOL-EUR";
      name = "Solana";
      chart-link = "https://www.tradingview.com/chart/?symbol=INDEX:SOLEUR";
    }
    {
      symbol = "BTC-EUR";
      name = "Bitcoin";
      chart-link = "https://www.tradingview.com/chart/?symbol=INDEX:BTCEUR";
    }
    {
      symbol = "SPY";
      name = "S&P 500";
    }
    {
      symbol = "NDQ";
      name = "Nasdaq";
    }
    # {
    #   symbol = "NVDA";
    #   name = "Nvidia";
    # }
    # {
    #   symbol = "AAPL";
    #   name = "Apple";
    #   symbol-link = "https://www.google.com/search?tbm=nws&q=apple";
    # }
  ];

}
