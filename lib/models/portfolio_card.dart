import 'package:crypto_tracker/services/portfolio_preferences_services.dart';
import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget{
  PortfolioCard({
    required this.symbol,
    required this.image,
    required this.earn,
    required this.currentPrice,
    required this.buyPrice,
    required this.quantity,
  });
  late final String symbol;
  late final String image;
  late final num earn;
  late final num currentPrice;
  late final num buyPrice;
  late final num quantity;

  String addSpaces(String toEdit) {
    String tmp = "";
    if (toEdit.length < 8) {
      while (toEdit.length < 9) {
        tmp = toEdit;
        toEdit = " " + tmp;
      }
      return toEdit;
    } else {
      return toEdit;
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 4, left: 3, right: 3, bottom: 4),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            border: Border(
              bottom: BorderSide(
                color: Colors.grey, width: 1.5
              ),
            ),
          ),
          padding: const EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 8),
          child: SizedBox(
            height: 65,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 8),
                  SizedBox(
                    width: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      height: 40,
                      width: 40,
                      child: Container(
                        child: Image.network(image),
                      ),
                    ),
                  ),
                  SizedBox(width:11),
                  SizedBox(
                    width: 48,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width:48,
                       //   padding: const EdgeInsets.all(0.0),
                          child: Text(
                            symbol.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                          //    fontWeight: FontWeight.w100,
                              fontFamily: 'Walkway'
                            ),
                          ),
                        ),
                      ],),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(1.0, 0.0, 15.0, 0.0),
                    child: SizedBox(
                        width: 190,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),

                          child: Container(
                            height: 70,
                            child: FittedBox(
                              fit: BoxFit.fill,


                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Buy Price:',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Quantity:',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Current Price: ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Earn:',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [

                                      Text(
                                        buyPrice.toString() + '\$',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        quantity.toString() + ' ' + symbol,
                                        style:  const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(

                                        addSpaces(currentPrice.toStringAsFixed(2)) + '\$',
                                        style:  const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        earn.toDouble().toDouble() < 0
                                            ? earn.toDouble().toStringAsFixed(1) + '\$'
                                            : '+' +
                                            earn.toDouble().toStringAsFixed(1) + '\$',
                                        style: TextStyle(
                                          color: earn.toDouble().toDouble() < 0
                                              ? Colors.red
                                              : Colors.green,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ),


                 Container(

                    alignment: AlignmentDirectional.centerStart,
                    width: 23,
                    child: /* Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [ */

                        FloatingActionButton.small(
                          heroTag: "btnPortfolio",
                          onPressed: (){
                            PortfolioPreferences().removePortfolioToDb(symbol);
                          },
                          child: const Icon(Icons.delete_forever, color: Colors.greenAccent, size: 20, ),
                            backgroundColor: Colors.grey[800],//Color(0xE0E50619),
                        ),
              //        ],
                   ),
                  //),
                ]),
          ),
        ),
      ),
    );
  }
}