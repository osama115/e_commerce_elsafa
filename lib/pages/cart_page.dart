import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_elsafa_marwa_4/cubit/cubit.dart';
import 'package:ecommerce_elsafa_marwa_4/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../cubit/states.dart';
import '../presentation/color_manager.dart';
import '../presentation/string_manager.dart';
import '../presentation/values_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ShopCubit(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state)
        {
          final userId = FirebaseAuth.instance.currentUser?.uid;
          if (userId == null) {
            return Center(child: Text("No user is signed in"));
          }
          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .collection('cart')
                .snapshots(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              final cartItems = snapshot.data?.docs ?? [];

              return ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (ctx, index) {
                  final productData = cartItems[index].data() as Map<String, dynamic>;
                  final product = ProductModel.fromJson(productData);

                  return ListTile(
                    leading: Image.network(product.image ?? ''),
                    title: Text(product.name ?? ''),
                    subtitle: Text("Quantity: ${product.quintaty} | Price: \$${product.price}"),
                    trailing:FloatingActionButton(onPressed: (){
                      ShopCubit.get(context).updateCartQuantity(ProductModel(),1);
                    }) ,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
