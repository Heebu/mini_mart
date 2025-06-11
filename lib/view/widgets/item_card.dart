import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/item_model.dart';
import '../home/product_page/product_view.dart';
import 'number_format.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductView(itemModel: itemModel,)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(itemModel.coverImage ?? itemModel.images[0])),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemModel.itemName, style: Theme.of(context).textTheme.bodyLarge),
                  Text(itemModel.description, style: Theme.of(context).textTheme.bodySmall),
                  Text('\$${formatNumber(itemModel.price)}.00', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
