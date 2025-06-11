import 'package:flutter/material.dart';
import 'package:mini_mart/view/home/profile_page/settings/setting_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../../main.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool theme = themeNotifier.value == ThemeMode.dark;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SettingsViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              ListTile(
                title: Text(theme? 'Dark Mode': 'Light Mode'),
                trailing: Switch(
                    value: theme,
                    onChanged: (value) {
                      themeNotifier.value =
                      themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    }),
              ),
              ListTile(
                title: Text('Notification'),
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              ListTile(
                title: Text('Log out'),
                trailing: Icon(Icons.logout),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Log Out'),
                        content:
                        Text('Would you like to log out of this account'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                viewModel.logOutFunc(context);
                              },
                              child: Text('Log Out'))
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: Text('Delete Account'),
                trailing: Icon(Icons.delete),
              ),
            ],
          ),
        );
      },
    );
  }
}