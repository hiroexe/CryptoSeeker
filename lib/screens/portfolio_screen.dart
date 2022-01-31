import 'dart:async';
import 'dart:convert';
import 'package:crypto_tracker/models/portfolio_card.dart';
import 'package:crypto_tracker/models/portfolio_crypto_model.dart';
import 'package:crypto_tracker/models/add_crypto_model.dart';
import 'package:crypto_tracker/screens/portfolio_screen_add_crypto.dart';
import 'package:crypto_tracker/services/portfolio_preferences_services.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as https;

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  List<String> portfolioListStats = PortfolioPreferences().getPortfolio() ?? [];

  // List tmpList = [];

  List<CryptoData>? getChartData() {
    chartData = [];
    for (int i = 0; i < portfolioListStats.length;) {
      chartData.add(CryptoData(
          portfolioListStats[i],
          double.parse(portfolioListStats[i + 1]),
          double.parse(portfolioListStats[i + 2])));
      //chartData.add(CryptoData("btc", 1000, 1));

      i += 3;
    }
    return chartData;
  }

  Future<List<PortfolioCryptoModel>> fetchCoinPortfolio() async {
    portfolioList = [];
    portfolioListStats = PortfolioPreferences().getPortfolio() ?? [];
    final response = await https.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];

            // tmpList.add(map.values.elementAt(1));
            /*    for (int j = 0; j < map.values.length;) {
            if (portfolioListStats[j] == map.values.elementAt(1)) {}
          } */

            if (portfolioListStats.contains(map.values.elementAt(1))) {
              portfolioList.add(PortfolioCryptoModel.fromJson(map));
            }
          }
        }
        /*    for (int j = 0; j < portfolioListStats.length;) {
          if (!tmpList.contains(portfolioListStats[j])) {
            PortfolioPreferences().removePortfolioToDb(portfolioListStats[j]);
          }
          j += 3;
        }

    */

        if (mounted) {
          setState(() {
            portfolioList;
          });
        }
      }
      return portfolioList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoinPortfolio();
    super.initState();
    Timer.periodic(
        const Duration(seconds: 15), (timer) => fetchCoinPortfolio());
    _tooltipBehavior = TooltipBehavior(enable: true);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      const PortfolioScreen();
      getChartData();
    });
  }

  num earn(num buyPrice, num currentPrice, num quantity) {
    num earn = (currentPrice * quantity) - (buyPrice * quantity);
    return earn;
  }

  late TooltipBehavior _tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Container(
        padding: EdgeInsets.only(top: 5.0, left: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.small(
              heroTag: "Btn1",
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCryptoToChart()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          if (portfolioList.isNotEmpty)
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1),
                    top: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: SfCircularChart(
                    backgroundColor: Colors.black,//Color(0xFF5DB68A),//grey[800],
    /*
                  annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Container(
                          child: PhysicalModel(
                              child: Container(),
                              shape: BoxShape.circle,
                              elevation: 10,
                              shadowColor: Colors.yellow,
                              color: Colors.grey),
                        ),
                      ),
                      CircularChartAnnotation(
                        widget: Container(
                          child: const Text(
                            "\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
*/
                    palette: <Color>[
                      Colors.lightGreenAccent,
                      Colors.purpleAccent,
                      Colors.yellowAccent,
                      Colors.redAccent,
                      Color(0xFF083BC1),
                      Colors.cyanAccent,
                      Colors.orangeAccent,
                      Colors.purple,
                      Colors.deepPurpleAccent,
                      Colors.green,
                      Colors.grey,
                      Colors.teal,
                      Color(0xffde75d0),
                      Color(0xc9a5740e),
                      Colors.blueGrey
                    ],
                    legend: Legend(
                      backgroundColor: Colors.black,
                      position: LegendPosition.right,
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 15,
                        fontFamily: 'Walkway',
                        color: Colors.white,
                      ),
                      iconHeight: 8,
                      iconWidth: 8,
                      iconBorderWidth: 1,
                      iconBorderColor: Colors.black
                    ),
                    tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries>[
                      DoughnutSeries<CryptoData, String>(
                        innerRadius: '40%',
                        explode: true,
                        strokeColor: Colors.black87,
                        strokeWidth: 0.7,
                        dataSource: getChartData(),
                        xValueMapper: (CryptoData data, _) =>
                            data.name.toUpperCase(),
                        yValueMapper: (CryptoData data, _) => (data.quantity *
                                (portfolioList
                                    .firstWhere(
                                        (element) => element.symbol == data.name)
                                    .currentPrice))
                            .round(),
                        dataLabelSettings: const DataLabelSettings(

                          isVisible: true,
                          useSeriesColor: true,
                          textStyle: TextStyle(color: Colors.black),
                          labelPosition: ChartDataLabelPosition.outside,
                        ),
                        enableTooltip: true,
                        opacity: 1,
                        legendIconType: LegendIconType.circle,
                      )
                    ],
                    //),
                  ),
                ),
              ),
            ),
          if (portfolioList.isNotEmpty)
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: portfolioList.length,
              itemBuilder: (context, index) {
                return PortfolioCard(
                  symbol: portfolioList[index].symbol,
                  image: portfolioList[index].image,
                  earn: earn(
                    double.parse(portfolioListStats[portfolioListStats
                            .indexOf(portfolioList[index].symbol) +
                        1]),
                    portfolioList[index].currentPrice,
                    double.parse(portfolioListStats[portfolioListStats
                            .indexOf(portfolioList[index].symbol) +
                        2]),
                  ),
                  buyPrice: double.parse(portfolioListStats[
                      portfolioListStats.indexOf(portfolioList[index].symbol) +
                          1]),
                  quantity: double.parse(portfolioListStats[
                      portfolioListStats.indexOf(portfolioList[index].symbol) +
                          2]),
                  currentPrice: (portfolioList
                      .firstWhere((element) =>
                          element.symbol == portfolioList[index].symbol)
                      .currentPrice),
                );
              },
            ),
        ],
      ),
    );
  }
}
