
import 'package:stacked/stacked.dart';

import '../../../model/user_model.dart';

class ProfilePageViewmodel extends BaseViewModel{
  UserModel user = UserModel(name: '', email: 'email', id: 'id', picture: 'picture', address: 'address', state: 'state', date: DateTime.now(), updateDate: DateTime.now(),);

}