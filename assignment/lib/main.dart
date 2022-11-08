import 'package:assignment/cubit/tools_cubit.dart';
import 'package:assignment/cubit/tools_state.dart';
import 'package:assignment/screens/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'componants/constunt.dart';
import 'cubit/bloc_observer.dart';
import 'dio_helper/cashe_helper.dart';
import 'dio_helper/dio_helper.dart';
import 'screens/home.dart';
import 'style/themes.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      DioHelper.init();
      await CacheHelper.init();

      Widget widget1;

      // token = CacheHelper.getDate(key: "token") ?? "";

      // print(token);
      // // // if (onboarding != null) {
      // if (token != null) {
      //   widget1 = HomeScreen();
      // } else {
      //   widget1 = Login_Screen();
      // }

      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  // Widget widget;
  // MyApp(this.widget, {super.key});

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
                  child: Login_Screen(), // widget,

                  top: true,
                ));
          },
        ));
  }
}
