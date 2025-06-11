
class CartModel {
  final String userId;
  final String itemId;
  final String cartId;
  final String itemName;
  final String itemImage;
  final int count;
  final int price;
  final DateTime date;

  const CartModel ({
    required this.itemName,
    required this.itemId,
    required this.cartId,
    required this.userId,
    required this.itemImage,
    required this.count,
    required this.price,
    required this.date,
  });

  factory CartModel.fromMap (Map<String, dynamic> map){
    return CartModel(
      itemName: map['itemName'] ?? '',
      itemId: map['itemId'] ?? '',
      cartId: map['cartId'] ?? '',
      itemImage: map['itemImage'] ?? '',
      userId: map['userId'] ?? '',
      count: map['itemCount'] ?? '',
      price: map['price'] ?? '',
      date: map['date'] as DateTime,
    );
  }

}