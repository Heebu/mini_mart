import 'package:alpha_twelve/model/cart_model.dart';
import 'package:alpha_twelve/services/cart_service.dart';
import 'package:alpha_twelve/services/order_service.dart';
import 'package:alpha_twelve/view/widgets/snack_bar.dart';
import 'package:stacked/stacked.dart';

class CartPageViewmodel extends BaseViewModel{
  List<CartModel> allCart = <CartModel>[];
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

  editCart() async{

  }
  deleteCart(String itemId, context) async{
    String result = await CartService().deleteItemInCart(itemId);
    showSnackBar(context, result);
    await getAllCart(context);
  }

  addToOrder(context) async{
    isLoading = true;
    notifyListeners();
   try{
     for(int x = 0; x< allCart.length; x++){
       final item = allCart[x];
     String result = await OrderService().addToOrder(item.itemName, item.count, item.price, item.itemId, 'address', 'state');
     if(result == 'success'){
       await deleteCart(item.itemId, context);
       showSnackBar(context, 'Payment successful');
     }
     else{
       showSnackBar(context, result);
     }
     }
   }catch(e){
     showSnackBar(context, e.toString());
   }
    isLoading = false;
    notifyListeners();
  }

  getAllCart(context) async{
    try{
      allCart = (await CartService().getAllCart())!;
      getTotal();

      notifyListeners();
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
}