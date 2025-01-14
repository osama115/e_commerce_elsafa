
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_elsafa_marwa_4/register/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates > {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);


  void createUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      uId: uId,
      image: 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984800.jpg?w=740&t=st=1711545369~exp=1711545969~hmac=cc00231321d08c58a5129bd8b99c4846a65defc13bc7b697cee00b172ebebf00',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }


  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
        uId: value.user!.uid,
      );
      // emit(SocialRegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasword = true;

  void changePasswordVisiability() {
    isPasword = !isPasword;
    suffix =
    isPasword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

}
