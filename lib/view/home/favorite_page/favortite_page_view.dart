import 'package:alpha_twelve/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'favorite_page_viewmodel.dart';

class FavoritePageView extends StatelessWidget {
  const FavoritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getAllFavorite(context),
      viewModelBuilder: () => FavoritePageViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(title: Text('Favourites'),),
            body: viewModel.allFavorite.isEmpty? Center(
              child: Text('No picked favorite'),
            ): ListView.separated(
                itemBuilder: (context, index) {
                  FavoriteModel item = viewModel.allFavorite[index];
                  return Container(
                    height: 132.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      // color: Colors.purple,
                        borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: Row(

                      children: [
                        Container(
                          width: 100.w,
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(item.itemImage)),
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.itemName, style: Theme.of(context).textTheme.bodyMedium,),
                            Text(item.itemPrice.toString(), style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),),
                            Text('in stock', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green),),
                            IconButton.filledTonal(onPressed: () async{
                              await viewModel.deleteFav(item.itemId, context);
                            }, icon: Icon(Icons.delete)),
                          ],
                        )
                      ],
                    ),
                  );
                } ,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 5.h,
                  );
                },
                itemCount: viewModel.allFavorite.length),
          );
        },);
  }
}
