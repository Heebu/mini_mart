
class OrderModel {
  final String userId;
  final String itemId;
  final String cartId;
  final String itemName;
  final String address;
  final String state;
  final String status;
  final int count;
  final int price;
  final DateTime date;

  const OrderModel ({
    required this.itemName,
    required this.itemId,
    required this.cartId,
    required this.userId,
    required this.state,
    required this.status,
    required this.address,
    required this.count,
    required this.price,
    required this.date,
  });

  factory OrderModel.fromMap (Map<String, dynamic> map){
    return OrderModel(
      itemName: map['itemName'] ?? '',
      itemId: map['itemId'] ?? '',
      cartId: map['cartId'] ?? '',
      userId: map['userId'] ?? '',
      state: map['state'] ?? '',
      address: map['address'] ?? '',
      status: map['status'] ?? '',
      count: map['itemCount'] ?? 0,
      price: map['price'] ?? 0,
      date: map['date'] ?? DateTime.now(),
    );
  }

}