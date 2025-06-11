import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/splash_screen.dart';
import 'package:mini_mart/utils/themes.dart';

final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, mode, _) {
          return ScreenUtilInit(
            designSize: const Size(450.0, 700.0),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              ScreenUtil.init(context);
              return MaterialApp(

                title: 'MiniMart – eCommerce',
                themeMode: mode,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                debugShowCheckedModeBanner: false,

                home: const SplashView(),
              );
            },
          );
        },
      ),
    );
  }

}


