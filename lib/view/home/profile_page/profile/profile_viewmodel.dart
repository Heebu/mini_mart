import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../model/user_model.dart';

class ProfileViewmodel extends BaseViewModel {
  UserModel? userModel;
  String imageUrl = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  bool isLoading = false;

  void pickImage(context) async{

  }

  void updateUserProfile(context) async{
    isLoading = true;
    notifyListeners();


    isLoading = false;
    notifyListeners();
  }

  void getUser(BuildContext context) async {

  }

}