import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/item_card.dart';
import 'category_page/category_view.dart';
import 'home_page_viewmodel.dart';


class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: FlutterLogo(),
            title: Column(
              children: [
                Text('Delivery Address'),
                Text('Address, Delivery'),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () async{},
                icon: Icon(Icons.notifications_active),
              ),
            ],
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 250,
                    child: GridView.builder(
                      itemCount: viewModel.category.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 5.h,
                        mainAxisExtent: 100,
                      ),
                      itemBuilder: (context, index) {
                        final cat = viewModel.category[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryView(name: cat['name']!,),));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(image: AssetImage(cat['image']!), fit: BoxFit.cover)
                            ),
                            child: Center(child: Text(cat['name']!, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800, backgroundColor: Colors.white60),)),
                          ),
                        );
                      },
                    ),
                  ),
              
                  Text('For you', style: Theme.of(context).textTheme.titleMedium),
              
                  SizedBox(
                    height: 500.h,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

