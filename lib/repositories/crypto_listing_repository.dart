import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/crypto_listing_model.dart';

class CryptoListingRepository {
  static Future<List<CryptoListingModel>> all() async {
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
}
