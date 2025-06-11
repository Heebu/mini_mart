
class FavoriteModel {
  final String itemId;
  final String userId;
  final String itemName;
  final String itemImage;
  final int itemPrice;
  final DateTime date;

  const FavoriteModel({
    required this.itemId,
    required this.itemName,
    required this.userId,
    required this.date,
    required this.itemImage,
    required this.itemPrice,
});

  factory FavoriteModel.toMap(Map<String, dynamic> map) {
    return FavoriteModel(
        itemId: map['itemId'] ?? '',
        itemName: map['itemName'] ?? '',
        userId: map['userId'] ?? '',
        date: map['date'] ?? DateTime.now(),
        itemImage: map['itemImage'] ?? '',
        itemPrice: map['itemPrice'] ?? 0,
    );
  }
}