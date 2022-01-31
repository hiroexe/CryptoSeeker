import 'dart:ui';

import 'package:crypto_tracker/screens/crypto_screen.dart';
import 'package:crypto_tracker/screens/watchlist_screen.dart';
import 'package:crypto_tracker/screens/portfolio_screen.dart';
import 'package:crypto_tracker/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 1;
  static const List<Widget> _screenList = [
    WatchlistScreen(),
    CryptoScreen(),
    PortfolioScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
       // centerTitle: true,
        title: Row(
        mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'C R Y P T O',
         //     textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Walkway',
                color: Colors.greenAccent,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              height: 45,
              width: 45,
              child: Image(image: AssetImage('assets/ic_launcher.png'),
                fit: BoxFit.contain,
                height: 45,
              ),
            ),
            SizedBox(width: 5),
            const Text(
              'S E E K E R',
            //  textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Walkway',
                color: Colors.greenAccent,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),

          ],
        ),


        leading:
        GestureDetector(
          onDoubleTap: () async => await signInProvider.logOut(),
          onTap: () {},

          child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white70,

          ),
        ),


      ),
      body: _screenList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label : ('Crypto'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: ( 'Portfolio'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
      ),
    );
  }
}
