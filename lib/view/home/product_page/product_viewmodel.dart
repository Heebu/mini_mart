import 'package:alpha_twelve/model/favorite_model.dart';
import 'package:alpha_twelve/services/cart_service.dart';
import 'package:alpha_twelve/view/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/item_model.dart';
import '../../../services/favorite_service.dart';

class ProductViewmodel extends BaseViewModel {
  int count = 1;
  int total = 0;
  bool isLoading = false;
  bool isFavorite = false;

  addItemCount(int itemMax, int itemPrice) {
    if (count < itemMax) {
      count++;
      total = count* itemPrice;
      notifyListeners();
    }
  }

  removeItem(int itemPrice) {
    if (count > 1) {
      count--;
      total = count* itemPrice;
      notifyListeners();
    }
  }

  favoriteItem(ItemModel itemModel) async {
    if (isFavorite) {
      FavoriteService().favoriteItem(itemModel);
      isFavorite = true;
      notifyListeners();
    } else {
      FavoriteService().unfavoriteItem(itemModel);
      isFavorite = false;
      notifyListeners();
    }
  }

  // add to cart
  Future<String> addToCart(ItemModel itemModel, context) async {
    isLoading = true;
    notifyListeners();
    String result = 'an unexpected error occurred';
    try {
      await CartService().addToCart(
        itemModel.itemName,
        count,
        itemModel.price * count,
        itemModel.itemId,
       itemModel.coverImage?? itemModel.images[0],
      );
      showSnackBar(context, 'Item Added');
      Navigator.pop(context);
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    isLoading = false;
    notifyListeners();
    return result;
  }

  getFavorite(ItemModel itemModel) async {
    final incomingData =
        await FavoriteService().favoritePath
            .where('itemId', isEqualTo: itemModel.itemId)
            .get();
    incomingData.docs.isEmpty ? isFavorite == false : isFavorite == true;
    notifyListeners();
  }

  initClass(itemModel) async {
    await getFavorite(itemModel);
  }
}
