import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  final String symbol;
  final String name;
  final double price;
  final double variation24Hours;

  const CryptoListTile({
    required this.symbol,
    required this.name,
    required this.price,
    required this.variation24Hours,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        symbol,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        name,
        style: TextStyle(
          color: Colors.white54,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "\$ ${price.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: 2),
          Text(
            "${variation24Hours.toStringAsFixed(1)}%",
            style: TextStyle(
              fontSize: 12,
              color: variation24Hours >= 0 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
