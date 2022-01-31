import 'dart:async';
import 'dart:convert';
import 'package:crypto_tracker/models/chart_sample_data_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as https;
import 'package:crypto_tracker/services/watchlist_preferences_services.dart';

class CoinScreen extends StatefulWidget {
  late final String id;
  late final String symbol;
  late final String name;
  late final String image;
  late final double currentPrice;
  late final double priceChange_24h;
  late final double priceChangePercentage_24h;
  late final double totalVolume;
  late final double marketCap;
  late final double marketCapRank;
  late final double circulatingSupply;
  late final double high_24h;
  late final double low_24h;
  late final double ath;
  late final String ath_date;
  bool favorite = false;

  CoinScreen(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.currentPrice,
      required this.priceChange_24h,
      required this.priceChangePercentage_24h,
      required this.totalVolume,
      required this.marketCap,
      required this.marketCapRank,
      required this.circulatingSupply,
      required this.high_24h,
      required this.low_24h,
      required this.ath,
      required this.ath_date,
      favorite});

  @override
  CoinScreenState createState() => CoinScreenState(
      id,
      symbol,
      name,
      image,
      currentPrice,
      priceChange_24h,
      priceChangePercentage_24h,
      totalVolume,
      marketCap,
      marketCapRank,
      circulatingSupply,
      high_24h,
      low_24h,
      ath,
      ath_date,
      favorite);
}

class CoinScreenState extends State<CoinScreen> {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double priceChange_24h;
  final double priceChangePercentage_24h;
  final double totalVolume;
  final double marketCap;
  final double marketCapRank;
  final double circulatingSupply;
  final double high_24h;
  final double low_24h;
  final double ath;
  final String ath_date;
  bool favorite;

  CoinScreenState(
      this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.priceChange_24h,
      this.priceChangePercentage_24h,
      this.totalVolume,
      this.marketCap,
      this.marketCapRank,
      this.circulatingSupply,
      this.high_24h,
      this.low_24h,
      this.ath,
      this.ath_date,
      this.favorite);

  late TrackballBehavior trackballBehavior;
  var f = NumberFormat.compact();
  List<String> initList = [];

  Future<List<ChartSampleData>> getChartData1() async {
    data1 = [];
    final response = await https.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/' +
            id +
            '/ohlc?vs_currency=usd&days=1'));
    if (response.statusCode == 200) {
      List<dynamic> values = json.decode(response.body);

      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            List<dynamic> list = values[i];
            data1.add(ChartSampleData.fromJson(list));
          }
        }
        if (mounted) {
          setState(() {
            data1;
          });
        }
      }
      return data1;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ChartSampleData>> getChartData7() async {
    data7 = [];
    final response = await https.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/' +
            id +
            '/ohlc?vs_currency=usd&days=7'));
    if (response.statusCode == 200) {
      List<dynamic> values = json.decode(response.body);

      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            List<dynamic> list = values[i];
            data7.add(ChartSampleData.fromJson(list));
          }
        }
        if (mounted) {
          setState(() {
            data7;
          });
        }
      }
      return data7;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ChartSampleData>> getChartData30() async {
    data30 = [];
    final response = await https.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/' +
            id +
            '/ohlc?vs_currency=usd&days=30'));
    if (response.statusCode == 200) {
      List<dynamic> values = json.decode(response.body);

      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            List<dynamic> list = values[i];
            data30.add(ChartSampleData.fromJson(list));
          }
        }
        if (mounted) {
          setState(() {
            data30;
          });
        }
      }
      return data30;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ChartSampleData>> getChartData90() async {
    data90 = [];
    final response = await https.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/' +
            id +
            '/ohlc?vs_currency=usd&days=90'));
    if (response.statusCode == 200) {
      List<dynamic> values = json.decode(response.body);

      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            List<dynamic> list = values[i];
            data90.add(ChartSampleData.fromJson(list));
          }
        }
        if (mounted) {
          setState(() {
            data90;
          });
        }
      }
      return data90;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ChartSampleData>> getChartData365() async {
    data365 = [];
    final response = await https.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/' +
            id +
            '/ohlc?vs_currency=usd&days=365'));
    if (response.statusCode == 200) {
      List<dynamic> values = json.decode(response.body);

      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            List<dynamic> list = values[i];
            data365.add(ChartSampleData.fromJson(list));
          }
        }
        if (mounted) {
          setState(() {
            data365;
          });
        }
      }
      return data365;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ChartSampleData>> getChartDataMax() async {
    dataMax = [];
    final response = await https.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/' +
            id +
            '/ohlc?vs_currency=usd&days=max'));
    if (response.statusCode == 200) {
      List<dynamic> values = json.decode(response.body);

      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            List<dynamic> list = values[i];
            dataMax.add(ChartSampleData.fromJson(list));
          }
        }
        if (mounted) {
          setState(() {
            dataMax;
          });
        }
      }
      return dataMax;
    } else {
      throw Exception('Failed to load data');
    }
  }

  getChartDataAll() {
    getChartData1();
    getChartData7();
    getChartData30();
    getChartData90();
    getChartData365();
    getChartDataMax();
  }

  void addOrRemove(bool favorite) {
    if (favorite == false) {
      WatchlistPreferences().addCryptoToDb(id);
    } else {
      WatchlistPreferences().removeCryptoToDb(id);
    }
  }

  @override
  void initState() {
    getChartDataAll();
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.longPress);
    Timer.periodic(const Duration(seconds: 60), (timer) => getChartDataAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initList = WatchlistPreferences().getWatchlist() ?? [];
    favorite = initList.contains(id);
    return Scaffold(
      appBar: AppBar(
        //   centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '|  ',
                ),
                Text(symbol.toUpperCase()),
                const Text('/USD')
              ]),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(favorite ? Icons.star : Icons.star_border),
              color: Colors.greenAccent,
              onPressed: () {
                addOrRemove(favorite);
                setState(() {
                  favorite = !favorite;
                });
              }),
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border(
                top: BorderSide(color: Colors.greenAccent, width: 2),
              ),
            ),
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 17, 12, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                children: [
                                  Text(
                                    !(name == 'Wrapped Bitcoin')
                                        ? name.length > 13
                                            ? symbol.length > 4
                                                ? name.substring(0, 10) + "..."
                                                : name.substring(0, 12) + "..."
                                            : name
                                        : name.substring(0, 9) + "..",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  Text("  "),
                                  //symbol.length == 5
                                  //    ?
                                  Text(
                                    symbol.toUpperCase(),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                  /*      : Text(
                                    symbol.toUpperCase(),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ), */
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            priceChangePercentage_24h.toDouble() == 0.00
                                ? Icon(Icons.remove, color: Colors.grey)
                                : priceChangePercentage_24h.toDouble() > 0.00
                                    ? Icon(Icons.arrow_upward_sharp,
                                        color: Colors.green)
                                    : Icon(Icons.arrow_downward_sharp,
                                        color: Colors.red),
                            SizedBox(width: 5),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                currentPrice.toDouble() < 1
                                    ? currentPrice.toDouble() < 0.0001
                                        ? currentPrice
                                            .toDouble()
                                            .toStringAsFixed(8)
                                        : currentPrice
                                            .toDouble()
                                            .toStringAsFixed(4)
                                    : currentPrice
                                        .toDouble()
                                        .toStringAsFixed(2),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'High 24h: ',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                high_24h.toDouble() < 1
                                    ? high_24h.toDouble() < 0.0001
                                        ? high_24h
                                                .toDouble()
                                                .toStringAsFixed(8) +
                                            ' \$'
                                        : high_24h
                                                .toDouble()
                                                .toStringAsFixed(4) +
                                            ' \$'
                                    : high_24h.toDouble().toStringAsFixed(2) +
                                        ' \$',
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Last 24h(%):  ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                priceChangePercentage_24h.toDouble() < 0
                                    ? priceChangePercentage_24h
                                        .toDouble()
                                        .toStringAsFixed(2)
                                    : '+' +
                                        priceChangePercentage_24h
                                            .toDouble()
                                            .toStringAsFixed(2),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color:
                                      priceChangePercentage_24h.toDouble() < 0
                                          ? Colors.red
                                          : Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Low 24h:  ',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              low_24h.toDouble() < 1
                                  ? low_24h.toDouble() < 0.0001
                                      ? low_24h.toDouble().toStringAsFixed(8) +
                                          ' \$'
                                      : low_24h.toDouble().toStringAsFixed(4) +
                                          ' \$'
                                  : low_24h.toDouble().toStringAsFixed(2) +
                                      ' \$',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Last 24h(usd): ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              priceChange_24h.toDouble() < 0
                                  ? priceChange_24h.toDouble() > -1
                                      ? priceChange_24h.toDouble() > -0.0001
                                          ? priceChange_24h
                                              .toDouble()
                                              .toStringAsFixed(8)
                                          : priceChange_24h
                                              .toDouble()
                                              .toStringAsFixed(4)
                                      : priceChange_24h
                                          .toDouble()
                                          .toStringAsFixed(2)
                                  : priceChange_24h.toDouble() < 1
                                      ? priceChange_24h.toDouble() < 0.0001
                                          ? '+' +
                                              priceChange_24h
                                                  .toDouble()
                                                  .toStringAsFixed(8)
                                          : '+' +
                                              priceChange_24h
                                                  .toDouble()
                                                  .toStringAsFixed(4)
                                      : '+' +
                                          priceChange_24h
                                              .toDouble()
                                              .toStringAsFixed(2),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: priceChange_24h.toDouble() < 0
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 360,
            child: DefaultTabController(
              length: 6,
              child: Scaffold(
                backgroundColor: Colors.black,
                bottomNavigationBar: chartMenu(),
                body: TabBarView(
                  children: [
                    SfCartesianChart(
                      plotAreaBorderColor: Colors.black,
                      trackballBehavior: trackballBehavior,
                      series: <CandleSeries>[
                        CandleSeries<ChartSampleData, DateTime>(
                            enableSolidCandles: true,
                            emptyPointSettings:
                                EmptyPointSettings(mode: EmptyPointMode.gap),
                            dataSource: data1,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            lowValueMapper: (ChartSampleData sales, _) =>
                                sales.low,
                            highValueMapper: (ChartSampleData sales, _) =>
                                sales.high,
                            openValueMapper: (ChartSampleData sales, _) =>
                                sales.open,
                            closeValueMapper: (ChartSampleData sales, _) =>
                                sales.close),
                      ],
                      primaryXAxis: DateTimeAxis(
                        //     interval: 3,
                        dateFormat: DateFormat.H(),
                        majorGridLines: const MajorGridLines(width: 0.05),
                        minorGridLines: const MinorGridLines(width: 0.05),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                      ),
                      primaryYAxis: NumericAxis(
                          majorGridLines: const MajorGridLines(width: 0.05),
                          minorGridLines: const MinorGridLines(width: 0.05),
                          minimum: currentPrice - (currentPrice / 100 * 30),
                          maximum: currentPrice + (currentPrice / 100 * 30),
                          //    interval: currentPrice / 13,
                          numberFormat:
                              NumberFormat.simpleCurrency(decimalDigits: 2)),
                    ),
                    SfCartesianChart(
                      plotAreaBorderColor: Colors.black,
                      trackballBehavior: trackballBehavior,
                      series: <CandleSeries>[
                        CandleSeries<ChartSampleData, DateTime>(
                            enableSolidCandles: true,
                            emptyPointSettings:
                                EmptyPointSettings(mode: EmptyPointMode.gap),
                            dataSource: data7,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            lowValueMapper: (ChartSampleData sales, _) =>
                                sales.low,
                            highValueMapper: (ChartSampleData sales, _) =>
                                sales.high,
                            openValueMapper: (ChartSampleData sales, _) =>
                                sales.open,
                            closeValueMapper: (ChartSampleData sales, _) =>
                                sales.close),
                      ],
                      primaryXAxis: DateTimeAxis(
                        //     interval: 3,
                        dateFormat: DateFormat.H(),
                        majorGridLines: const MajorGridLines(width: 0.05),
                        minorGridLines: const MinorGridLines(width: 0.05),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                      ),
                      primaryYAxis: NumericAxis(
                          majorGridLines: const MajorGridLines(width: 0.05),
                          minorGridLines: const MinorGridLines(width: 0.05),
                          minimum: currentPrice - (currentPrice / 100 * 30),
                          maximum: currentPrice + (currentPrice / 100 * 30),
                          //    interval: currentPrice / 13,
                          numberFormat:
                              NumberFormat.simpleCurrency(decimalDigits: 2)),
                    ),
                    SfCartesianChart(
                      plotAreaBorderColor: Colors.black,
                      trackballBehavior: trackballBehavior,
                      series: <CandleSeries>[
                        CandleSeries<ChartSampleData, DateTime>(
                            enableSolidCandles: true,
                            emptyPointSettings:
                                EmptyPointSettings(mode: EmptyPointMode.gap),
                            dataSource: data30,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            lowValueMapper: (ChartSampleData sales, _) =>
                                sales.low,
                            highValueMapper: (ChartSampleData sales, _) =>
                                sales.high,
                            openValueMapper: (ChartSampleData sales, _) =>
                                sales.open,
                            closeValueMapper: (ChartSampleData sales, _) =>
                                sales.close),
                      ],
                      primaryXAxis: DateTimeAxis(
                        //     interval: 3,
                        dateFormat: DateFormat.H(),
                        majorGridLines: const MajorGridLines(width: 0.05),
                        minorGridLines: const MinorGridLines(width: 0.05),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                      ),
                      primaryYAxis: NumericAxis(
                          majorGridLines: const MajorGridLines(width: 0.05),
                          minorGridLines: const MinorGridLines(width: 0.05),
                          //    interval: currentPrice / 13,
                          numberFormat:
                              NumberFormat.simpleCurrency(decimalDigits: 2)),
                    ),
                    SfCartesianChart(
                      plotAreaBorderColor: Colors.black,
                      trackballBehavior: trackballBehavior,
                      series: <CandleSeries>[
                        CandleSeries<ChartSampleData, DateTime>(
                            enableSolidCandles: true,
                            emptyPointSettings:
                                EmptyPointSettings(mode: EmptyPointMode.gap),
                            dataSource: data90,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            lowValueMapper: (ChartSampleData sales, _) =>
                                sales.low,
                            highValueMapper: (ChartSampleData sales, _) =>
                                sales.high,
                            openValueMapper: (ChartSampleData sales, _) =>
                                sales.open,
                            closeValueMapper: (ChartSampleData sales, _) =>
                                sales.close),
                      ],
                      primaryXAxis: DateTimeAxis(
                        //        interval: 3,
                        dateFormat: DateFormat.MMMd(),
                        majorGridLines: const MajorGridLines(width: 0.05),
                        minorGridLines: const MinorGridLines(width: 0.05),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                      ),
                      primaryYAxis: NumericAxis(
                          majorGridLines: const MajorGridLines(width: 0.05),
                          minorGridLines: const MinorGridLines(width: 0.05),
                          //          interval: currentPrice / 6,
                          numberFormat:
                              NumberFormat.simpleCurrency(decimalDigits: 2)),
                    ),
                    SfCartesianChart(
                      plotAreaBorderColor: Colors.black,
                      trackballBehavior: trackballBehavior,
                      series: <CandleSeries>[
                        CandleSeries<ChartSampleData, DateTime>(
                            enableSolidCandles: true,
                            emptyPointSettings: EmptyPointSettings(
                                mode: EmptyPointMode.average),
                            dataSource: data365,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            lowValueMapper: (ChartSampleData sales, _) =>
                                sales.low,
                            highValueMapper: (ChartSampleData sales, _) =>
                                sales.high,
                            openValueMapper: (ChartSampleData sales, _) =>
                                sales.open,
                            closeValueMapper: (ChartSampleData sales, _) =>
                                sales.close),
                      ],
                      primaryXAxis: DateTimeAxis(
                        //     interval: 1,
                        dateFormat: DateFormat.yMMM(),
                        majorGridLines: const MajorGridLines(width: 0.05),
                        minorGridLines: const MinorGridLines(width: 0.05),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                      ),
                      primaryYAxis: NumericAxis(
                          majorGridLines: const MajorGridLines(width: 0.05),
                          minorGridLines: const MinorGridLines(width: 0.05),
                          //   interval: (currentPrice / 6),
                          numberFormat:
                              NumberFormat.simpleCurrency(decimalDigits: 2)),
                    ),
                    SfCartesianChart(
                      plotAreaBorderColor: Colors.black,
                      trackballBehavior: trackballBehavior,
                      series: <CandleSeries>[
                        CandleSeries<ChartSampleData, DateTime>(
                            enableSolidCandles: true,
                            emptyPointSettings: EmptyPointSettings(
                                mode: EmptyPointMode.average),
                            dataSource: dataMax,
                            xValueMapper: (ChartSampleData sales, _) => sales.x,
                            lowValueMapper: (ChartSampleData sales, _) =>
                                sales.low,
                            highValueMapper: (ChartSampleData sales, _) =>
                                sales.high,
                            openValueMapper: (ChartSampleData sales, _) =>
                                sales.open,
                            closeValueMapper: (ChartSampleData sales, _) =>
                                sales.close),
                      ],
                      primaryXAxis: DateTimeAxis(
                        //     interval: 1,
                        dateFormat: DateFormat.yMMM(),
                        majorGridLines: const MajorGridLines(width: 0.05),
                        minorGridLines: const MinorGridLines(width: 0.05),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                      ),
                      primaryYAxis: NumericAxis(
                          majorGridLines: const MajorGridLines(width: 0.05),
                          minorGridLines: const MinorGridLines(width: 0.05),
                          //   interval: (currentPrice / 6),
                          numberFormat:
                              NumberFormat.simpleCurrency(decimalDigits: 2)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Image.network(image),
                        ),
                        SizedBox(width: 8),
                        Text(
                          symbol.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Volume:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          f.format(totalVolume) + ' USD',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Circulating Supply:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          f.format(circulatingSupply) +
                              ' ' +
                              symbol.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Market Cap:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          f.format(marketCap) + ' USD',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Market Cap Rank:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '# ' + marketCapRank.toStringAsFixed(0),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Time High:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          ath.toDouble() < 1
                              ? ath.toDouble() < 0.0001
                                  ? ath.toDouble().toStringAsFixed(8) + ' \$'
                                  : ath.toDouble().toStringAsFixed(4) + ' \$'
                              : ath.toDouble().toStringAsFixed(2) + ' \$',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Time High Date:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          ath_date.substring(0, 10),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget chartMenu() {
    return SizedBox(
      height: 54,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
        ),
        child: TabBar(
          labelColor: Colors.greenAccent,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[900],
          ),
          tabs: const [
            Tab(
              text: "1D",
            ),
            Tab(
              text: "1W",
            ),
            Tab(
              text: "1M",
            ),
            Tab(
              text: "3M",
            ),
            Tab(
              text: "1Y",
            ),
            Tab(
              text: "Max",
            ),
          ],
        ),
      ),
    );
  }
}
