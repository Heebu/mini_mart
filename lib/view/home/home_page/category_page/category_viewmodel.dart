import 'package:stacked/stacked.dart';
import '../../../../data/seed_data.dart';
import '../../../../model/item_model.dart';

class CategoryViewmodel extends BaseViewModel{
  List<ItemModel> allItems = allSeedItems;
  bool isLoading = false;
}