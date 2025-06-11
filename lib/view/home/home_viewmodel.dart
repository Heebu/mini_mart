import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';


class HomeViewModel extends BaseViewModel {
  PageController pageViewController = PageController();
  int pageNumber = 0;

  onChangePage(value){
    pageNumber = value;
    pageViewController.jumpToPage(value);
    notifyListeners();
  }
}