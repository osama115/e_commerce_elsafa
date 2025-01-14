import 'package:ecommerce_elsafa_marwa_4/pages/create_new_product.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/share_component.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
        FloatingActionButton(onPressed: (){
          navigateTo(context, CreateNewProduct());
        })
       ],
     ),

      );
  }
}
