import 'package:alpha_twelve/model/user_model.dart';
import 'package:alpha_twelve/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

class ProfilePageViewmodel extends BaseViewModel{
  UserModel user = UserModel(name: '', email: 'email', id: 'id', picture: 'picture', address: 'address', state: 'state', date: Timestamp.now(), updateDate: Timestamp.now(),);


  getUser() async{
    user = (await UserService().getUser())!;
    print(user);
    notifyListeners();
  }
}