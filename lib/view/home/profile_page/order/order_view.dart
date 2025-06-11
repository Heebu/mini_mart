import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'order_viewmodel.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OrderViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('My Orders'),
            ),
            body: viewModel.allOrders.isEmpty? Center(child: Text('No Order yet'),): Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: ListView.separated(itemBuilder: (context, index) {
                final order = viewModel.allOrders[index];
                return Container(
                  height: 70.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.purple,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text((index + 1).toString(), style: TextStyle(),),
                      ),
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name:  ',
                                style:
                                Theme.of(
                                  context,
                                ).textTheme.bodyMedium,
                              ),
                              Text(
                                order.itemName,
                                style:
                                Theme.of(
                                  context,
                                ).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Price:  ',
                                style:
                                Theme.of(
                                  context,
                                ).textTheme.bodyMedium,
                              ),

                              Text(
                                order.price.toString(),
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Text(
                                'Status:  ',
                                style:
                                Theme.of(
                                  context,
                                ).textTheme.bodyMedium,
                              ),

                              Text(
                                order.status,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }, separatorBuilder: (context, index) {
                return Divider();
              }, itemCount: viewModel.allOrders.length),
            ),
          );
        },);
  }
}
