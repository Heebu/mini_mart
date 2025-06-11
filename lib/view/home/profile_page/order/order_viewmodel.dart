
import 'package:mini_mart/data/seed_order.dart';
import 'package:stacked/stacked.dart';

import '../../../../model/order_model.dart';

class OrderViewmodel extends BaseViewModel{
  List<OrderModel> allOrders = allSeededOrder;
}