import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'crypto_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  Map<String, String> coinsValues = {};
  bool isWaiting;

  // get data from api and store it in coinsValues map
  void getData() async {
    isWaiting = true;
    CoinData coinData = CoinData();
    try {
      var mapPrices = await coinData.getCoinData(selectedCurrency);
      print('%% values -> ${mapPrices.values} %%');
      setState(() {
        coinsValues = mapPrices;
        isWaiting = false;
      });
    } on Exception catch (e) {
      print('Exception in getData() $e');
    }
  }

  // create 3 card for each currency
  List<CryptoCard> createCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          value: isWaiting ? '?' : coinsValues[crypto],
          selectedCurrency: selectedCurrency,
        ),
      );
    }
    return cryptoCards;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createCards(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            // child: Platform.isAndroid ? androidPicker() : iOSPicker(),
            child: Platform.isAndroid ? androidPicker() : iOSPicker(),
          ),
        ],
      ),
    );
  }

  DropdownButton<String> androidPicker() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      onSelectedItemChanged: (int index) {
        print(index);
        print('pickerItemText=  ${pickerItems[index].data}');
        selectedCurrency = pickerItems[index].data;
        getData();
      },
      scrollController: FixedExtentScrollController(initialItem: 19),
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      children: pickerItems,
    );
  }
}
