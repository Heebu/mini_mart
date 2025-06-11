import 'package:alpha_twelve/view/home/profile_page/profile/profile_view.dart';
import 'package:alpha_twelve/view/home/profile_page/profile_page_viewmodel.dart';
import 'package:alpha_twelve/view/home/profile_page/settings/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'order/order_view.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getUser(),
      viewModelBuilder: ()=> ProfilePageViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(title: Text('Profile'),),
            body: Column(
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundImage: NetworkImage(viewModel.user.picture ?? 'name'),
                ),
                Text(viewModel.user.name ?? 'name', style: Theme.of(context).textTheme.titleMedium,),
                ListTile(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileView(),));
                  },
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderView(),));
                  },
                  leading: Icon(Icons.list),
                  title: Text('Orders'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),


                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(),));
                  },
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),

                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.support_agent),
                  title: Text('Report'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.policy),
                  title: Text('Policy'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),

              ],
            ),
          );
        },);
  }
}
