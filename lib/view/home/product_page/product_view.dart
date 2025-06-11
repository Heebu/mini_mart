import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/view/home/product_page/product_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../model/item_model.dart';
import '../../widgets/number_format.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProductViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_outlined),
                          Text('Go back'),
                        ],
                      ),
                    ),
                
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      height: 350.h,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 350.h,
                            child: PageView.builder(
                              itemCount: itemModel.images.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        itemModel.images[index],
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              child: IconButton.filledTonal(
                                onPressed: () {
                                  viewModel.favoriteItem(itemModel);
                                },
                                icon:
                                    viewModel.isFavorite
                                        ? Icon(Icons.favorite_border)
                                        : Icon(Icons.favorite),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                
                    Text(
                      itemModel.itemName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                
                    Text(
                      '\$${formatNumber(itemModel.price)}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      itemModel.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'About this item'
                      'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.'
                      'There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.'
                      'This product will have a battery which exceeds 80% capacity relative to new.'
                      'Accessories will not be original, but will be compatible and fully functional. '
                          'Product may come in generic Box.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        height: 50.h,
                        child:
                            viewModel.isLoading
                                ? SizedBox(
                                  width: 50.w,
                                  child: CircularProgressIndicator(),
                                )
                                : ElevatedButton(
                                  onPressed: () async {
                                    await viewModel.addToCart(itemModel, context);
                                  },
                                  child: Text('Add to cart'),
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
