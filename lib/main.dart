import 'package:ecommerce_elsafa_marwa_4/cubit/cubit.dart';
import 'package:ecommerce_elsafa_marwa_4/cubit/states.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/home_page.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/onboarding.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/color_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/values_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'login/login_page.dart';



void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: ( context,  state) {},
        builder: ( context,  state) {
          return MaterialApp(
            home: onBoardingPage(),
            theme: ThemeData(
                primaryColor: Colors.blue,
                textTheme: TextTheme(
                  bodySmall: TextStyle(
                      fontSize: AppSize.s16,
                      color: ColorManager.black
                  ),
                  bodyMedium:TextStyle(
                      fontSize: AppSize.s20,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black
                  ),
                  bodyLarge: TextStyle(
                      fontSize: AppSize.s22,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor:ColorManager.white1,
                  selectedItemColor: ColorManager.purple,
                  unselectedItemColor: ColorManager.greyPurple ,
                  unselectedIconTheme:IconThemeData(color: ColorManager.greyPurple),
                  selectedIconTheme:IconThemeData(color: ColorManager.purple),
                ),
                appBarTheme: AppBarTheme(
                    color: ColorManager.white1
                ),

                scaffoldBackgroundColor: ColorManager.white),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
