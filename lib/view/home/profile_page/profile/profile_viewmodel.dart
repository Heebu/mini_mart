import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../model/user_model.dart';

class ProfileViewmodel extends BaseViewModel {
   UserModel userModel = UserModel(name: 'name', email: 'email', id: 'id', picture: 'picture', address: 'address', state: 'state', date: DateTime.now(), updateDate: DateTime.now());
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