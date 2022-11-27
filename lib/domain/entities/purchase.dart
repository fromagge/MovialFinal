class Purchase {
  String? id;
  DateTime purchaseDate;
  DateTime deliveredDate;
  String paymentMethod;
  String address;

  String userId;
  List<String> purchasedItems;

  Purchase(
      {this.id,
      required this.purchaseDate,
      required this.address,
      required this.paymentMethod,
      required this.deliveredDate,
      required this.userId,
      required this.purchasedItems});

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
        id: json['id'],
        purchaseDate: json['purchaseDate'],
        paymentMethod: json['paymentMethod'],
        address: json['address'],
        deliveredDate: json['deliveredDate'],
        userId: json['userId'],
        purchasedItems: json['purchasedItems']);
  }
  toJson() {
    return {
      'purchaseDate': purchaseDate,
      'paymentMethod': paymentMethod,
      'address': address,
      'deliveredDate': deliveredDate,
      'userId': userId,
      'purchasedItems': purchasedItems
    };
  }
}
