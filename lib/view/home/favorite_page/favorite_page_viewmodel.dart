import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/favorite_model.dart';
import '../../../utils/toast_manager.dart';

class FavoritePageViewmodel extends BaseViewModel{
  List<FavoriteModel> allFavorite = <FavoriteModel>[];


  deleteFav(String itemId, context) async{
    ///
    ToastManager().showToast(
      context: context,
      message: 'result',
      icon: Icons.check_circle,
      backgroundColor: Colors.red,
      position: ToastPosition.top,
    );
  }


}