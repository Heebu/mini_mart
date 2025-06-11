import 'package:flutter/material.dart';
import 'package:mini_mart/view/home/profile_page/profile_page_view.dart';

import 'package:stacked/stacked.dart';
import 'cart_page/cart_page_view.dart';
import 'favorite_page/favortite_page_view.dart';
import 'home_page/home_page_view.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: PageView(
            onPageChanged: (value){
              viewModel.onChangePage(value);
            },
            controller: viewModel.pageViewController,
            children: [
              HomePageView(),
              CartPageView(),
              FavoritePageView(),
              ProfilePageView(),


            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
              onTap: (value){
                viewModel.onChangePage(value);
              },
              currentIndex: viewModel.pageNumber,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home', tooltip: 'Home Page'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart', tooltip: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite', tooltip: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile', tooltip: 'Profile'),
          ]),
        );
      },
    );
  }
}
