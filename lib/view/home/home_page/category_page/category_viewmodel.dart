import 'package:stacked/stacked.dart';

import '../../../../model/item_model.dart';
import '../../../../services/item_service.dart';

class CategoryViewmodel extends BaseViewModel{
  List<ItemModel> allItems = <ItemModel>[];
  bool isLoading = false;


  getAllItems(String cat) async{
    isLoading = true;
    notifyListeners();
    final result = await ItemService().getCategoryItems(cat);
    allItems = result!;
    isLoading = false;
    notifyListeners();
  }

}