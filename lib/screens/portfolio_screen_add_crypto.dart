import 'package:flutter/material.dart';
import 'package:crypto_tracker/screens/portfolio_screen.dart';
import 'package:crypto_tracker/services/portfolio_preferences_services.dart';

class AddCryptoToChart extends StatefulWidget {
  const AddCryptoToChart({Key? key}) : super(key: key);

  @override
  _AddCryptoToChartState createState() => _AddCryptoToChartState();
}

class _AddCryptoToChartState extends State<AddCryptoToChart> {
  String _inputSymbol = "First try";
  double _inputPrice = -1;
  double _inputQuantity = -1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: const Text(
          "Add your crypto",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.grey[800],
                hintText: 'Enter your Crypto symbol',
                hintStyle: TextStyle(fontSize: 16,
                  color: Colors.grey[400],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(20.0),
              ),
              onChanged: (valueN) {
                _inputSymbol = valueN;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.grey[800],
                  hintText: 'Enter the price you bought your crypto',
                  hintStyle: TextStyle(fontSize: 16,
                    color: Colors.grey[400],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(20.0),
                ),
                onChanged: (valueP) {
                  _inputPrice = double.parse(valueP);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.grey[800],
                hintText: 'Enter the quantity of crypto you bought ',
                hintStyle: TextStyle(fontSize: 16,
                  color: Colors.grey[400],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(20.0),
              ),
              onChanged: (valueQ) {
                _inputQuantity = double.parse(valueQ);

              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "btn2",
        foregroundColor: Colors.greenAccent,
        backgroundColor: Colors.grey[900],
        label: const Text("ADD"),
        icon: const Icon(Icons.add),
        onPressed: () {
          PortfolioPreferences().addPortfolioToDb(_inputSymbol.toLowerCase(), _inputPrice, _inputQuantity);
          Navigator.pop(context, const PortfolioScreen());


        },
      ),
    );
  }
}

