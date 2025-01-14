import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_elsafa_marwa_4/cubit/states.dart';
import 'package:ecommerce_elsafa_marwa_4/model/product_model.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/color_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/string_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/values_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/explore_page.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/categories.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/cart_page.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/setting_page.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../model/user_model.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopChangeBottomNavStates());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = AppSize.si0;

  UserModel? userModel;

  List<Widget> scrren = [
    ExplorePage(),
    CategoriesPage(),
    CartPage(),
    SettingPage(),
  ];
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(
        icon: Icon(IconlyBroken.home), label: AppString.home),
    BottomNavigationBarItem(
        icon: Icon(IconlyBroken.category), label: AppString.categories),
    BottomNavigationBarItem(
        icon: Icon(IconlyBroken.bag), label: AppString.order),
    BottomNavigationBarItem(
        icon: Icon(IconlyBroken.setting), label: AppString.setting),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavStates());
  }

  List<ProductModel> products = [];
  List<String> productsId = [];

  void getNewProducts() {
    FirebaseFirestore.instance.collection('New-product').get().then((value) {
      emit(GetProductsSuccessState());
      value.docs.forEach((element) {
        productsId.add(element.id);
        print(productsId);
        products.add(ProductModel.fromJson(element.data()));
        print(products);
      });
    }).catchError((error) {
      emit(GetProductsErrorState(error.toString()));
    });
  }

  void getNewProductCleanning() {
    FirebaseFirestore.instance
        .collection('New-Product-Cleanning')
        .get()
        .then((value) {
      emit(GetProductsSuccessState());
      value.docs.forEach((element) {
        productsId.add(element.id);
        print(productsId);
        products.add(ProductModel.fromJson(element.data()));
        print(products);
      });
    }).catchError((error) {
      emit(GetProductsErrorState(error.toString()));
    });
  }

  void getNewProductAcceissories() {
    FirebaseFirestore.instance
        .collection('New-product-acceissories')
        .get()
        .then((value) {
      emit(GetProductsSuccessState());
      value.docs.forEach((element) {
        productsId.add(element.id);
        print(productsId);
        products.add(ProductModel.fromJson(element.data()));
        print(products);
      });
    }).catchError((error) {
      emit(GetProductsErrorState(error.toString()));
    });
  }

  void getNewProductToys() {
    FirebaseFirestore.instance
        .collection('New-product-toys')
        .get()
        .then((value) {
      emit(GetProductsSuccessState());
      value.docs.forEach((element) {
        productsId.add(element.id);
        print(productsId);
        products.add(ProductModel.fromJson(element.data()));
        print(products);
      });
    }).catchError((error) {
      emit(GetProductsErrorState(error.toString()));
    });
  }

  // void getfavorite(){
  //   FirebaseFirestore.instance.collection('New-product').get().then((value) {
  //     emit(GetProductsSuccessState());
  //     value.docs.forEach((element) {
  //       element.reference.collection('inFavorites').get().then((value) {
  //         favorite.add(value.docs.length as ProductModel);
  //         productsId.add(element.id);
  //         products.add(ProductModel.fromJson(element.data()));
  //       }).catchError((error) {});
  //     });
  //   }).catchError((error) {
  //     emit(GetProductsErrorState(error.toString()));
  //   });
  // }
  void getfavorite() {}

  // void FavoriteAction(String postId) {
  //   FirebaseFirestore.instance
  //       .collection('New-product')
  //       .doc(postId)
  //       .collection('inFavorites')
  //       .doc(userModel!.uId)
  //       .set({'likes': true}).then((value) {
  //     emit(FavoritePostSuccessState());
  //   }).catchError((error) {
  //     emit(FavoritePostErrorState(error.toString()));
  //   });
  // }

  

  Future<void> addToCart(ProductModel product) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final cartRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(product.uId); // Use product ID as the document ID

      try {
        await cartRef.set(product.toMap());
        print("Product added to cart successfully!");
      } catch (e) {
        print("Error adding product to cart: $e");
      }
    }
  }

  Future<void> updateCartQuantity(ProductModel product, int quantity) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      final cartRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(product.uId);  // Use product ID as the document ID

      try {
        // Check if product exists in the cart
        final cartDoc = await cartRef.get();

        if (cartDoc.exists) {
          // If the product exists, get the current quantity
          int currentQuantity = int.parse(cartDoc.get('quintaty') ?? '0');
          int newQuantity = currentQuantity + quantity;

          // If new quantity is less than or equal to 0, remove the product
          if (newQuantity <= 0) {
            await cartRef.delete();
            print("Product removed from cart.");
          } else {
            // Update the quantity of the product in the cart
            await cartRef.update({
              'quintaty': newQuantity.toString(),
            });
            print("Product quantity updated to $newQuantity.");
          }
        } else {
          // If the product doesn't exist in the cart, add it with the given quantity
          product.quintaty = quantity.toString();
          await cartRef.set(product.toMap());
          print("Product added to cart with quantity: $quantity");
        }
      } catch (e) {
        print("Error updating cart quantity: $e");
      }
    }
  }


}