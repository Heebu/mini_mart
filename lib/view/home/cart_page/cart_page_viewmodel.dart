import 'package:mini_mart/data/seed_order.dart';
import 'package:stacked/stacked.dart';

import '../../../data/all_cart.dart';
import '../../../model/cart_model.dart';
import '../../../model/order_model.dart';
import '../../widgets/snack_bar.dart';

class CartPageViewmodel extends BaseViewModel{
  List<CartModel> allCart = allSeededCart;
  bool isLoading = false;

  int total = 0;


  getTotal() {
    int number = 0;
    for(int x = 0; x<allCart.length; x++){
      print(allCart[x].price);
      number = allCart[x].price + number;
    }
    total = number;
    notifyListeners();
  }


  deleteCart(int index, context) async{
allCart.removeAt(index);
  }

  addToOrder(context) async{
    isLoading = true;
    notifyListeners();
   try{
     for(int x = 0; x< allCart.length; x++){
       final item = allCart[x];
    allSeededOrder.add(
         OrderModel(itemName: item.itemName, itemId: item.itemId, cartId: item.cartId, userId: item.userId, state: 'item.state', status: 'pending', address: 'address', count: item.count, price: item.price, date: DateTime.now()));
       await deleteCart(x, context);
       showSnackBar(context, 'Payment successful');
     }
   }catch(e){
     showSnackBar(context, e.toString());
   }
    isLoading = false;
    notifyListeners();
  }


}