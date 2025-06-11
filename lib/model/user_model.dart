
class UserModel {
  final String name;
  final String email;
  final String id;
  final String picture;
  final String address;
  final String state;
  final DateTime date;
  final DateTime updateDate;

  const UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.picture,
    required this.address,
    required this.state,
    required this.date,
    required this.updateDate,
});
  
  
  factory UserModel.toMap(Map<String, dynamic> map){
    return UserModel(
        name: map['name'] ?? '',
        id: map['id'] ?? '',
        email:  map['email'] ?? '',
        picture:  map['picture'] ?? '',
        address:  map['address'] ?? '',
        state:  map['state'] ?? '',
        date:  map['date'] ?? DateTime.now(),
        updateDate:  map['updateDate'] ?? DateTime.now());
  }

}