import 'package:stacked/stacked.dart';

import '../../../model/favorite_model.dart';
import '../../widgets/snack_bar.dart';

class FavoritePageViewmodel extends BaseViewModel{
  List<FavoriteModel> allFavorite = <FavoriteModel>[];


  deleteFav(String itemId, context) async{

    ///
    showSnackBar(context, 'result');
  }


}