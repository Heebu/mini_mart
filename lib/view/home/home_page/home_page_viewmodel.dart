import 'package:alpha_twelve/services/item_service.dart';
import 'package:stacked/stacked.dart';

import '../../../model/item_model.dart';

class HomePageViewModel extends BaseViewModel{
  List<ItemModel> allItems = <ItemModel>[];

  getAllItems() async{
    final result = await ItemService().getAllItems();
    allItems = result!;
    notifyListeners();
  }

  List<Map<String, String>> category = [
    {'name': 'Food', 'image': 'images/food.png'},
    {'name': 'Drink', 'image': 'images/drinks.png'},
    {'name': 'Technology', 'image': 'images/electronics.png'},
    {'name': 'Clothes', 'image': 'images/cloths.png'},
    {'name': 'Books', 'image': 'images/books.png'},
    {'name': 'Tool', 'image': 'images/tools.png'},
  ];


}