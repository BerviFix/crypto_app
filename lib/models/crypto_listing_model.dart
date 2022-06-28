class CryptoListingModel {
  final String symbol;
  final String name;
  final int id;
  final double price;
  final double variation24Hours;

  const CryptoListingModel({
    required this.symbol,
    required this.name,
    required this.id,
    required this.price,
    required this.variation24Hours,
  });

  factory CryptoListingModel.fromData(Map<String, dynamic> data) {
    final id = data['id'];
    final name = data['name'];
    final symbol = data['symbol'];
    final price = data['quote']['USD']['price'];
    final variation24Hours = data['quote']['USD']['percent_change_24h'];

    return CryptoListingModel(
      id: id,
      name: name,
      symbol: symbol,
      price: price,
      variation24Hours: variation24Hours,
    );
  }
}
