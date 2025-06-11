import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/view/home/profile_page/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/button.dart';
import '../../../widgets/custom_textfield.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () => ProfileViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Edit profile'),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                        ),
                        Align(
                          alignment: Alignment(1, .9),
                          child: IconButton(onPressed: (){
                            viewModel.pickImage(context);
                          }, icon: Icon(Icons.add_circle_outlined)),
                        )
                      ],
                    ),
                  ),

                  CustomTextfield(controller: viewModel.nameController, label: 'first name', keyboardInputType: TextInputType.name,),
                  CustomTextfield(controller: viewModel.lastnameController, label: 'Last name', keyboardInputType: TextInputType.name,),

                  Spacer(),
                  viewModel.isLoading? Center(child: SizedBox(
                    height: 100.h, width: 100,
                    child: CircularProgressIndicator(),
                  ),) :Botton(title: 'Submit', onPressed: () {
                    viewModel.updateUserProfile(context);
                  }),
                ],
              ),
            ),
          );
        },);
  }
}
