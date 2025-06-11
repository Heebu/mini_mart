import 'package:stacked/stacked.dart';
import '../../../data/seed_data.dart';
import '../../../model/item_model.dart';

class HomePageViewModel extends BaseViewModel{
  List<ItemModel> allItems = allSeedItems;


  List<Map<String, String>> category = [
    {'name': 'Food', 'image': 'images/food.png'},
    {'name': 'Drink', 'image': 'images/drinks.png'},
    {'name': 'Technology', 'image': 'images/electronics.png'},
    {'name': 'Clothes', 'image': 'images/cloths.png'},
    {'name': 'Books', 'image': 'images/books.png'},
    {'name': 'Tool', 'image': 'images/tools.png'},
  ];


}