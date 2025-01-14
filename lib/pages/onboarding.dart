import 'package:ecommerce_elsafa_marwa_4/login/login_page.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/color_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/share_component.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/string_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/values_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/register/cubit/states.dart';
import 'package:ecommerce_elsafa_marwa_4/register/register_page.dart';
import 'package:flutter/material.dart';

import '../presentation/assets_manager.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageAssets.login),fit: BoxFit.fill)
        ),
        child: Column(
          children: [
            Expanded(child:
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage(ImageAssets.logo)),
                SizedBox(height: AppSize.s10,),
                Text(AppString.welcomeToElSafaShop,
                style: TextStyle(
                  fontSize: AppSize.s35,
                  color: ColorManager.white1
                ),)
                ],
              ),
            )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(image: AssetImage(ImageAssets.logo))
                  //     ,borderRadius: BorderRadius.circular(AppSize.s25),
                  //   ),
                  // ),
                  defaultButtonCustomBlur(function: (){
                    navigateTo(context, LoginPage());
                  }, text: AppString.login),

                  SizedBox(height: AppSize.s20,),

                  defaultButton(function: (){
                    navigateTo(context, RegisterPage());
                  }, text: AppString.register),

                  SizedBox(height: AppSize.s30,),

                  defaultTextButton(function: (){}, text: AppString.forgotPassword)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
