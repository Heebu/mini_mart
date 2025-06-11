import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/item_card.dart';
import 'category_viewmodel.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CategoryViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body:
              SafeArea(child:
              viewModel.isLoading
                  ? Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              )
                  : SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130.h,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 40.w),
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10.r)
                              ),
                              child: TextField(decoration: InputDecoration(hintText: 'Search'),),
                            ),
                            Divider(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back_ios_new),
                                ),
                                Text(
                                  name,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 40.w),
                                width: 250.w,
                                child: Text('Smartphones, Laptops & Assecories',style: GoogleFonts.ibmPlexMono(

                                ), )),
                          ],
                        ),
                      ),
                      viewModel.allItems.isEmpty
                          ? Center(child: Text('No data here'))
                          : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.w,
                            mainAxisSpacing: 5.h,
                            mainAxisExtent: 300,
                          ),
                          itemCount: viewModel.allItems.length,
                          itemBuilder: (context, index) {
                            return ItemCard(
                              itemModel: viewModel.allItems[index],
                            );
                          },
                        ),
                      ),
                    ],
                  )
              ),
              ),
        );
      },
    );
  }
}
