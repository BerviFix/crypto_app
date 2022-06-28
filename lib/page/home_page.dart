// ignore_for_file: dead_code, unused_local_variable

import 'package:crypto_app/models/crypto_listing_model.dart';
import 'package:crypto_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/crypto_list_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CryptoListingModel>> cryptoListingFuture;

  @override
  void initState() {
    super.initState();
    cryptoListingFuture = downloadCryptoData();
  }

  Future<List<CryptoListingModel>> downloadCryptoData() async {
    final urlListing = Uri.parse(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest");

    final responseListing = await http.get(urlListing, headers: {
      "X-CMC_PRO_API_KEY": "6ec2edc3-b4c9-4f76-829f-b6a5818bc31e",
    });

    final jsonData = jsonDecode(responseListing.body);
    final cryptoListing = (jsonData["data"] as List<dynamic>).map((cryptoData) {
      return CryptoListingModel.fromData(cryptoData);
    }).toList();

    return cryptoListing;

    // for (var i = 0; i <= cryptoListing.length; i++) {
    //   final urlInfo = Uri.parse(
    //       "https://pro-api.coinmarketcap.com/v1/cryptocurrency/info?id=${cryptoListing[i].id}");

    //   final responseInfo = await http.get(urlInfo, headers: {
    //     "X-CMC_PRO_API_KEY": "6ec2edc3-b4c9-4f76-829f-b6a5818bc31e",
    //   });

    //   final jsonDataInfo = jsonDecode(responseInfo.body);

    //   print(jsonDataInfo);
    // }
  }

  void refreshData() {
    setState(() {
      cryptoListingFuture = downloadCryptoData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackgroundColor,
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() => AppBar(
        backgroundColor: ThemeColors.cardBackgroundColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: refreshData, icon: Icon(Icons.refresh_outlined)),
        title: Image.network(
          'https://i.ibb.co/4T6tnY3/coinmarketcap-white-1.png',
          width: 180,
        ),
        // Text(
        //   "Kraken",
        //   style: TextStyle(
        //     letterSpacing: 5,
        //     color: Colors.purpleAccent,
        //   ),
        // ),
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

  Widget body() => Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: ThemeColors.cardBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            bodyHeader(),
            Divider(),
            bodyContent(),
          ],
        ),
      );

  Widget bodyHeader() => Container(
        child: ListTile(
          title: Text(
            'Lista Crypto',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('Basato sulla top 100'),
          trailing: Text('Mostra tutte'),
        ),
      );

  Widget bodyContent() => Expanded(
        child: Container(
          child: FutureBuilder<List<CryptoListingModel>>(
            future: cryptoListingFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => CryptoListTile(
                    symbol: snapshot.data![index].symbol,
                    name: snapshot.data![index].name,
                    price: snapshot.data![index].price,
                    variation24Hours: snapshot.data![index].variation24Hours,
                  ),
                  separatorBuilder: (context, index) => Divider(),
                );
              }
            },
          ),
        ),
      );
}
