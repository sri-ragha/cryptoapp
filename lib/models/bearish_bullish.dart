// class BearBullAllData {
//   final BullBearData bearbullalldata;

//   BearBullAllData({
//     required this.bearbullalldata,
//   });

//   factory BearBullAllData.fromJson(Map<String, dynamic> json) {
//     print(json['Data']);
//     return BearBullAllData(
//       bearbullalldata: BullBearData.fromJson(json['Data']),
//     );
//   }
// }

class BullBearData {
  final String symbol;
  final NetGrowth netgrowth;
  final ConcentrationVar concentrationvar;
  final LargestVar largestvar;
  final InOutVar inoutvar;

  BullBearData({
    required this.symbol,
    required this.netgrowth,
    required this.concentrationvar,
    required this.largestvar,
    required this.inoutvar,
  });

  factory BullBearData.fromJson(Map<String, dynamic> json) {
    return BullBearData(
      symbol: json['symbol'] as String,
      netgrowth: NetGrowth.fromJson(json['addressesNetGrowth']),
      concentrationvar: ConcentrationVar.fromJson(json['concentrationVar']),
      largestvar: LargestVar.fromJson(json['largetxsVar']),
      inoutvar: InOutVar.fromJson(json['inOutVar']),
    );
  }
}

class NetGrowth {
  final String category;
  final String sentiment;
  final double value;
  final double score;
  final double threshbear;
  final double threshbull;

  NetGrowth({
    required this.category,
    required this.sentiment,
    required this.value,
    required this.score,
    required this.threshbear,
    required this.threshbull,
  });

  factory NetGrowth.fromJson(Map<String, dynamic> json) {
    return NetGrowth(
      category: json['category'] as String,
      sentiment: json['sentiment'] as String,
      value: (json['value'] as num).toDouble(),
      score: (json['score'] as num).toDouble(),
      threshbear: (json['score_threshold_bearish'] as num).toDouble(),
      threshbull: (json['score_threshold_bullish'] as num).toDouble(),
    );
  }
}

class ConcentrationVar {
  final String category;
  final String sentiment;
  final double value;
  final double score;
  final double threshbear;
  final double threshbull;

  ConcentrationVar({
    required this.category,
    required this.sentiment,
    required this.value,
    required this.score,
    required this.threshbear,
    required this.threshbull,
  });

  factory ConcentrationVar.fromJson(Map<String, dynamic> json) {
    return ConcentrationVar(
      category: json['category'] as String,
      sentiment: json['sentiment'] as String,
      value: (json['value'] as num).toDouble(),
      score: (json['score'] as num).toDouble(),
      threshbear: (json['score_threshold_bearish'] as num).toDouble(),
      threshbull: (json['score_threshold_bullish'] as num).toDouble(),
    );
  }
}

class LargestVar {
  final String category;
  final String sentiment;
  final double value;
  final double score;
  final double threshbear;
  final double threshbull;

  LargestVar({
    required this.category,
    required this.sentiment,
    required this.value,
    required this.score,
    required this.threshbear,
    required this.threshbull,
  });

  factory LargestVar.fromJson(Map<String, dynamic> json) {
    return LargestVar(
      category: json['category'] as String,
      sentiment: json['sentiment'] as String,
      value: (json['value'] as num).toDouble(),
      score: (json['score'] as num).toDouble(),
      threshbear: (json['score_threshold_bearish'] as num).toDouble(),
      threshbull: (json['score_threshold_bullish'] as num).toDouble(),
    );
  }
}

class InOutVar {
  final String category;
  final String sentiment;
  final double value;
  final double score;
  final double threshbear;
  final double threshbull;

  InOutVar({
    required this.category,
    required this.sentiment,
    required this.value,
    required this.score,
    required this.threshbear,
    required this.threshbull,
  });

  factory InOutVar.fromJson(Map<String, dynamic> json) {
    return InOutVar(
      category: json['category'] as String,
      sentiment: json['sentiment'] as String,
      value: (json['value'] as num).toDouble(),
      score: (json['score'] as num).toDouble(),
      threshbear: (json['score_threshold_bearish'] as num).toDouble(),
      threshbull: (json['score_threshold_bullish'] as num).toDouble(),
    );
  }
}
