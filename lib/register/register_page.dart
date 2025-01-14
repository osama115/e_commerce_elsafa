

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/home_page.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/onboarding.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/assets_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/register/cubit/cubit.dart';
import 'package:ecommerce_elsafa_marwa_4/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';
import '../../../presentation/values_manager.dart';
import '../presentation/share_component.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state){
          if(state is CreateUserSuccessState){
            navigateAndFinish(context, HomePage());
          }
        },

        builder: (context, state) {
          return Scaffold(
            // appBar: AppBar(),
            body: Container(
              width: double.infinity,
              height: AppSize.s700,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.pageLogin6),
                      fit: BoxFit.fill)
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSize.s20),
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
                          Text(
                            AppString.register,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                              color: ColorManager.black,
                            ),
                          ),
                          Text(
                            AppString.registerNow,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: ColorManager.grey),
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          defualtFormFieldCutomeForShopPurple(
                            controller: nameController,
                            inputType: TextInputType.name,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return AppString.pleaseName;
                              }
                              return null;
                            },
                            labelText: AppString.userName,
                            prefix: Icons.person,
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          defualtFormFieldCutomeForShopPurple(
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return AppString.pleaseEmail;
                              }
                              return null;
                            },
                            labelText: AppString.emailAd,
                            prefix: Icons.email_outlined,
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          defualtFormFieldCutomeForShopPurple(
                            controller: passWordController,
                            inputType: TextInputType.visiblePassword,
                            suffix: RegisterCubit
                                .get(context)
                                .suffix,
                            onSubmit: (value) {
                              // if (formKey.currentState!.validate()) {
                              //   SocialRegisterCubit.get(context).userLogin(
                              //     email: emailController.text,
                              //     password: passWordController.text,
                              //   );
                              // }
                            },
                            isPassword: RegisterCubit
                                .get(context)
                                .isPasword,
                            suffixPressed: () {
                              RegisterCubit.get(context)
                                  .changePasswordVisiability();
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return AppString.pleasePass;
                              }
                              return null;
                            },
                            labelText: AppString.password,
                            prefix: Icons.lock_open_outlined,
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          defualtFormFieldCutomeForShopPurple(
                            controller: phoneController,
                            inputType: TextInputType.phone,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return AppString.pleasePhone;
                              }
                              return null;
                            },
                            labelText: AppString.phone,
                            prefix: Icons.phone,
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) =>
                                defaultButton2(
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      RegisterCubit.get(context).userRegister(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passWordController.text,
                                        phone: phoneController.text,
                                      );
                                    }
                                  },
                                  text: AppString.register,
                                  isUpperCase: true,
                                ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          // const SizedBox(
                          //   height: AppSize.s15,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     const Text(AppString.dontHaveAnAccount),
                          //     defaultTextButton(
                          //       function: () {
                          //         navigateTo(context, SocialRegisterScreen());
                          //       },
                          //       text: AppString.register,
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
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
