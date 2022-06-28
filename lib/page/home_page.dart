import 'package:crypto_app/themes/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackgroundColor,
      appBar: appBar(),
    );
  }

  AppBar appBar() => AppBar(
        backgroundColor: ThemeColors.cardBackgroundColor,
        centerTitle: true,
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.refresh_outlined)),
        title: Text(
          "Kraken",
          style: TextStyle(
            letterSpacing: 5,
            color: Colors.purpleAccent,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundImage: NetworkImage('https://is.gd/NpGJMI'),
                radius: 15,
              ))
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Il mio saldo",
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "€ 1245.00",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
