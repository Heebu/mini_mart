import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/item_card.dart';
import 'category_viewmodel.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getAllItems(name),
      viewModelBuilder: () => CategoryViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(title: Text(name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),),
              centerTitle: false,
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios_new)),

            ),
            body: viewModel.isLoading? Center(child: SizedBox(height: 100, width: 100, child: CircularProgressIndicator(),),):SizedBox(
              child: viewModel.allItems.isEmpty? Center(child: Text('No data here'),):GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 5.h,
                  mainAxisExtent: 300,
                ),
                itemCount: viewModel.allItems.length,
                itemBuilder: (context, index) {
                  return ItemCard(itemModel: viewModel.allItems[index],);
                },
              ),
            )
          );
        },);
  }
}
