
class ItemModel {
  final String itemName;
  final String category;
  final String description;
  final String itemId;
  final String ownerId;
  final String? coverImage;
  final List images;
  final int price;
  final int? offPercent;
  final int quantity;
  final int? maxOrder;
  final DateTime datePost;
  final DateTime updateDate;

  const ItemModel({
    required this.itemName,
    required this.category,
    required this.description,
    required this.images,
    required this.ownerId,
    required this.itemId,
    this.coverImage,
    required this.price,
    this.offPercent,
    required this.quantity,
    this.maxOrder,
    required this.datePost,
    required this.updateDate,
});
  factory ItemModel.fromMap(Map<String, dynamic> map){
    return ItemModel(
        itemName: map['itemName'] ?? '',
        itemId: map['itemId'] ?? '',
      ownerId: map['ownerId'] ?? '',
        category: map['category'] ?? '',
        description: map['description'] ?? '',
        images: map['images'] ?? [],
        coverImage: map['coverImage'] ?? '',
        price: map['price'] ?? 0,
        offPercent: map['offPercent'] ?? 0,
        quantity: map['quantity'] ?? 0,
        maxOrder: map['maxOrder'] ?? 0,
        datePost: map['datePost'] ?? DateTime.now(),
        updateDate:  map['updateDate'] ?? DateTime.now(),
    );
  }
}