import 'package:alpha_twelve/model/favorite_model.dart';
import 'package:alpha_twelve/services/favorite_service.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/snack_bar.dart';

class FavoritePageViewmodel extends BaseViewModel{
  List<FavoriteModel> allFavorite = <FavoriteModel>[];


  deleteFav(String itemId, context) async{
    String result = await FavoriteService().deleteItemInFav(itemId);
    showSnackBar(context, result);
    await getAllFavorite(context);
  }

  getAllFavorite(context) async{
    try{
      allFavorite = (await FavoriteService().getAllFav())!;
      notifyListeners();
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

}