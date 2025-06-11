
import 'package:flutter/material.dart';
import 'package:mini_mart/data/all_cart.dart';
import 'package:mini_mart/model/cart_model.dart';
import 'package:stacked/stacked.dart';
import '../../../model/item_model.dart';
import '../../widgets/snack_bar.dart';

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
      // FavoriteService().favoriteItem(itemModel);
      isFavorite = true;
      notifyListeners();
    } else {
      // FavoriteService().unfavoriteItem(itemModel);
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
     allSeededCart.add(CartModel(itemName: itemModel.itemName, itemId: itemModel.itemId, cartId: 'cartId', userId: '', itemImage: itemModel.images[0], count: count, price: itemModel.price, date: DateTime.now()));
      showSnackBar(context, 'Item Added');
      Navigator.pop(context);
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    isLoading = false;
    notifyListeners();
    return result;
  }

  }
