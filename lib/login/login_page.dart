import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_elsafa_marwa_4/login/cubit/cubit.dart';
import 'package:ecommerce_elsafa_marwa_4/login/cubit/states.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/onboarding.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home_page.dart';
import '../presentation/color_manager.dart';
import '../presentation/share_component.dart';
import '../presentation/string_manager.dart';
import '../presentation/values_manager.dart';
import '../register/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                // clipBehavior:Clip.hardEdge,
                width: double.infinity,
                height: AppSize.s700,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageAssets.pageLogin6),
                        fit: BoxFit.fill)
                ),
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(AppSize.s30),
                          child: IconButton(onPressed: () {
                            navigateBack(context, onBoardingPage());
                          }, icon: Icon(Icons.arrow_back),color: ColorManager.white1,),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(AppSize.s30),
                          child: Text(
                            AppString.Login,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                              color: ColorManager.white1,
                            ),),
                        ),

                        const SizedBox(
                          height: AppSize.s120,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s30),
                          child: Column(
                            children: [
                              defualtFormFieldCutomeForShopPurple(
                                controller: emailController,
                                inputType: TextInputType.emailAddress,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppString.pleaseEmail;
                                  }
                                  return null;
                                },
                                labelText: AppString.email,
                                prefix: Icons.email_outlined,
                              ),

                              const SizedBox(
                                height: AppSize.s15,
                              ),
                              defualtFormFieldCutomeForShopPurple(
                                controller: passWordController,
                                inputType: TextInputType.visiblePassword,
                                suffix: LoginCubit
                                    .get(context)
                                    .suffix,
                                onSubmit: (value) {
                                  if (formKey.currentState!.validate()) {
                                    // SocialLoginCubit.get(context).userLogin(
                                    //   email: emailController.text,
                                    //   password: passWordController.text,
                                    // );
                                  }
                                },
                                isPassword: LoginCubit
                                    .get(context)
                                    .isPasword,
                                suffixPressed: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisiability();
                                },
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppString.pleasePass;
                                  }
                                  return null;
                                },
                                labelText: AppString.password,
                                prefix: Icons.key,
                              ),
                              const SizedBox(
                                height: AppSize.s30,
                              ),
                              ConditionalBuilder(
                                condition: state is! LoginLoadingState,
                                builder: (context) =>
                                    defaultButton2(
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          LoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passWordController.text,
                                          );
                                          navigateTo(context, HomePage());
                                        }
                                      },
                                      text: AppString.login,
                                      isUpperCase: true,
                                    ),
                                fallback: (context) =>
                                    Center(child: CircularProgressIndicator()),
                              ),
                              const SizedBox(
                                height: AppSize.s15,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     const Text(AppString.dontHaveAnAccount,style: TextStyle(fontSize: AppSize.s10),),
                              //     defaultTextButton(
                              //       function: () {
                              //         navigateTo(context, HomePage());
                              //       },
                              //       text: AppString.register,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
