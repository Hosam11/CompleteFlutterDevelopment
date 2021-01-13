import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

// https://rest.coinapi.io/v1/exchangerate/BTC/<USD>?apikey=6D115FDB-46D8-4912-B4BE-73866BFA6848
const String baseUrl = 'https://rest.coinapi.io/v1/exchangerate';
const String apiKey = '6D115FDB-46D8-4912-B4BE-73866BFA6848';

class CoinData {
  /// take currency that you want to return prices for like (USD, EUR.. etc)
  /// then looping on cryptoList then make 3 http calls and save result in map
  /// and return it
  Future<Map<String, String>> getCoinData(String currency) async {
    // map to hold the currency and it's price
    Map<String, String> cryptoCurrencyMap = {};

    for (String crypto in cryptoList) {
      String url = '$baseUrl/$crypto/$currency?apikey=$apiKey';
      print('url is >> $url');
      http.Response res = await http.get(url);
      if (res.statusCode == 200) {
        var decodedData = jsonDecode(res.body);
        var latestPrice = decodedData['rate'].toStringAsFixed(0);
        cryptoCurrencyMap[crypto] = latestPrice;
      } else {
        print('Problem with the get ${res.statusCode}');
      }
    }
    return cryptoCurrencyMap;
  }
}
