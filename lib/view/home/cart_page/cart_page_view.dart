import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'cart_page_viewmodel.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getAllCart(context),
      viewModelBuilder: () => CartPageViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Cart')),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 450.h,
                    child:
                        viewModel.allCart.isEmpty
                            ? Center(child: Text('Cart is empty'))
                            : ListView.separated(
                              itemBuilder: (context, index) {
                                final item = viewModel.allCart[index];
                                return Container(
                                  height: 132.h,
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
                                      Container(
                                        width: 100.w,
                                        margin: EdgeInsets.only(right: 10.w),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(item.itemImage),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.itemName,
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.bodyMedium,
                                          ),
                                          Text(
                                            item.price.toString(),
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            'in stock',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(color: Colors.green),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton.filledTonal(
                                                onPressed: () {},
                                                icon: Icon(Icons.remove),
                                              ),
                                              Text(item.count.toString()),
                                              IconButton.filledTonal(
                                                onPressed: () {},
                                                icon: Icon(Icons.add),
                                              ),
                                              IconButton.filledTonal(
                                                onPressed: () async {
                                                  await viewModel.deleteCart(
                                                    item.cartId,
                                                    context,
                                                  );
                                                },
                                                icon: Icon(Icons.delete),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 5.h);
                              },
                              itemCount: viewModel.allCart.length,
                            ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Order Info',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SubTotal',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '\$${viewModel.total}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '\$10',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '\$${viewModel.total + 10}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),

                      viewModel.isLoading
                          ? Center(
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(),
                            ),
                          )
                          : SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              onPressed: () async {
                                await viewModel.addToOrder(context);
                              },
                              child: Text(
                                'CheckOut(\$${viewModel.total + 10})',
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
