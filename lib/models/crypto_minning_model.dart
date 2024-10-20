class Data {
  final MinningModel minning_model;

  Data({
    required this.minning_model,
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
      minning_model: MinningModel.fromJson(parsedJson['CoinInfo']),
    );
  }
}

class MinningModel {
  final String imgurl;
  final String name;
  final String fullname;
  final String algorithm;
  final String prooftype;
  final double nethash;
  final double blocknumber;
  final double blocktime;
  final double blockreward;
  final double maxsupply;

  MinningModel({
    required this.imgurl,
    required this.name,
    required this.fullname,
    required this.algorithm,
    required this.prooftype,
    required this.nethash,
    required this.blocknumber,
    required this.blocktime,
    required this.blockreward,
    required this.maxsupply,
  });

  factory MinningModel.fromJson(Map<String, dynamic> json) {
    return MinningModel(
      imgurl: json['ImageUrl'] as String,
      name: json['Name'] as String,
      fullname: json['FullName'] as String,
      algorithm: json['Algorithm'] as String,
      prooftype: json['ProofType'] as String,
      nethash: (json['NetHashesPerSecond'] as num).toDouble(),
      blocknumber: (json['BlockNumber'] as num).toDouble(),
      blocktime: (json['BlockTime'] as num).toDouble(),
      blockreward: (json['BlockReward'] as num).toDouble(),
      maxsupply: (json['MaxSupply'] as num).toDouble(),
    );
  }
}
