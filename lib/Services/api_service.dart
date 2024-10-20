import 'dart:convert';
import 'package:crypto_app/models/bearish_bullish.dart';
import 'package:crypto_app/models/crypto_minning_model.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:crypto_app/models/news_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxController {
  var isLoading = false.obs;
  // RawData? apiout;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
    fetchNewsData();
    fetchbearishbullish();
  }

  Future<List<CryptoRawData>> fetchData() async {
    http.Response cryptolist = await http.get(
      Uri.tryParse(
          'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&convert=INR')!,
      headers: {
        'Accepts': 'application/json',
        'X-CMC_PRO_API_KEY': '9baff1b4-d800-4c2e-b354-822a9ab04bba',
      },
    );

    Map<String, dynamic> cryptolistjson = jsonDecode(cryptolist.body);
    List<dynamic> cryptobodylist = cryptolistjson['data'];
    List<CryptoRawData> cryptolistdata = cryptobodylist
        .map((dynamic crypto) => CryptoRawData.fromJson(crypto))
        .toList();
    print(cryptolistdata);
    return cryptolistdata;
  }

  // API News Data
  Future<List<NewsModel>> fetchNewsData() async {
    http.Response newsresponse = await http.get(
      Uri.tryParse('https://min-api.cryptocompare.com/data/v2/news/?lang=EN')!,
      headers: {
        'authorization':
            '67e9810b5f798b2b5d69c79b723a91983f17794b6e5c7aee1dabf0bae538ea77',
      },
    );

    Map<String, dynamic> json = jsonDecode(newsresponse.body);
    List<dynamic> body = json['Data'];
    List<NewsModel> newsmodel =
        body.map((dynamic item) => NewsModel.fromJson(item)).toList();
    return newsmodel;
  }

  // Crtypto Minning API
  Future<List<Data>> fetchcryptominningData() async {
    http.Response cryptominningresponse = await http.get(
      Uri.tryParse(
          'https://min-api.cryptocompare.com/data/top/totalvolfull?limit=100&tsym=INR')!,
      headers: {
        'authorization':
            '67e9810b5f798b2b5d69c79b723a91983f17794b6e5c7aee1dabf0bae538ea77',
      },
    );
    Map<String, dynamic> jsoncryptominning =
        jsonDecode(cryptominningresponse.body);
    List<dynamic> bodycryptominning = jsoncryptominning['Data'];
    List<Data> cryptomodelminning = bodycryptominning
        .map((dynamic itemcrypto) => Data.fromJson(itemcrypto))
        .toList();
    return cryptomodelminning;
  }

  // Crtypto Bearish or Bullish API
  Future<BullBearData> fetchbearishbullish() async {
    http.Response cryptobullbear = await http.get(
      Uri.tryParse(
          'https://min-api.cryptocompare.com/data/tradingsignals/intotheblock/latest?fsym=BTC')!,
      headers: {
        'authorization':
            '67e9810b5f798b2b5d69c79b723a91983f17794b6e5c7aee1dabf0bae538ea77',
      },
    );

    if (cryptobullbear.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(cryptobullbear.body);
      return BullBearData.fromJson(jsonResponse['Data']);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
