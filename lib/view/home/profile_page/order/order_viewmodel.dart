import 'package:alpha_twelve/model/order_model.dart';
import 'package:alpha_twelve/services/order_service.dart';
import 'package:stacked/stacked.dart';

class OrderViewmodel extends BaseViewModel{
  List<OrderModel> allOrders = <OrderModel>[];

  getAllOrders() async{
    allOrders = (await OrderService().getAllOrder())!;
    notifyListeners();
  }

}