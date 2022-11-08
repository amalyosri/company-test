// ignore_for_file: avoid_print, sort_child_properties_last, must_be_immutable

import 'package:assignment/cubit/tools_cubit.dart';
import 'package:assignment/cubit/tools_state.dart';
import 'package:assignment/screens/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/bloc_observer.dart';
import 'dio_helper/cashe_helper.dart';
import 'dio_helper/dio_helper.dart';
import 'style/themes.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      DioHelper.init();
      await CacheHelper.init();

      Widget widget1;
      // bool? onboarding = CacheHelper.getDate(key: "onboarding");
      // token = CacheHelper.getDate(key: "token");

      // print(token);
      // // if (onboarding != null) {
      // if (token != null) {
      //   widget1 = HomeScreen();
      // } else {
      //   widget1 = Login_Screen();
      // }
      // }
      // else {
      //   widget1 = story();
      // }

      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  // Widget widget1;
  // MyApp(this.widget1, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PhotoCubit(),
        child: BlocConsumer<PhotoCubit, PhotoStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                themeMode: ThemeMode.light,
                home: SafeArea(
                  child: Login_Screen(),
                  top: true,
                )
                //Login_Screen(),
                );
          },
        ));
  }
}
