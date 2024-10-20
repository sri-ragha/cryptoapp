class CryptoRawData {
  final String name;
  final String symbol;
  final double? maxsupply;
  final double? totalsupply;
  final INR inr;

  CryptoRawData({
    required this.name,
    required this.symbol,
    this.maxsupply,
    this.totalsupply,
    required this.inr,
  });

  factory CryptoRawData.fromJson(Map<String, dynamic> json) {
    return CryptoRawData(
      name: json['name'],
      symbol: json['symbol'],
      maxsupply: (json['max_supply'] as num?)?.toDouble(),
      totalsupply: (json['total_supply'] as num?)?.toDouble(),
      inr: INR.fromJson(json['quote']),
    );
  }
}

class INR {
  final CryptoDataInr cryptoinr;

  INR({required this.cryptoinr});

  factory INR.fromJson(Map<String, dynamic> json) {
    return INR(
      cryptoinr: CryptoDataInr.fromJsom(json['INR']),
    );
  }
}

class CryptoDataInr {
  final double price;
  final double volchng;
  final double perchng;
  final double mrktcap;
  final double mrktcapdom;

  CryptoDataInr({
    required this.price,
    required this.volchng,
    required this.perchng,
    required this.mrktcap,
    required this.mrktcapdom,
  });

  factory CryptoDataInr.fromJsom(Map<String, dynamic> parsedjson) {
    return CryptoDataInr(
      price: (parsedjson['price'] as num).toDouble(),
      volchng: (parsedjson['volume_change_24h'] as num).toDouble(),
      perchng: (parsedjson['percent_change_1h'] as num).toDouble(),
      mrktcap: (parsedjson['market_cap'] as num).toDouble(),
      mrktcapdom: (parsedjson['market_cap_dominance'] as num).toDouble(),
    );
  }
}
