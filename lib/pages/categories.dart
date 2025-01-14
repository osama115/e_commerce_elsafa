import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_elsafa_marwa_4/cubit/cubit.dart';
import 'package:ecommerce_elsafa_marwa_4/model/product_model.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/products/new_poduct_cleaning.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/products/new_product.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/products/new_product_accessories.dart';
import 'package:ecommerce_elsafa_marwa_4/pages/products/new_product_toys.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../cubit/states.dart';
import '../presentation/color_manager.dart';
import '../presentation/string_manager.dart';
import '../presentation/values_manager.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppSize.si2,
          crossAxisSpacing: AppSize.s10,
          //mainAxisExtent: AppSize.s10,
          childAspectRatio: AppSize.s0_9),
      children: [
        cardView2(
            'toy',
            'https://img.freepik.com/free-psd/3d-illustration-children-s-toy-gaming-controller_23-2149345301.jpg?t=st=1730270722~exp=1730274322~hmac=fcecb4122311671e8642fca56a19c045e121c1658364b6d54b6b4b0642625306&w=740',
            ColorManager.purple,
            NewProductToysPage(),
            context)
        ,cardView2(
            'cleaning',
            'https://img.freepik.com/free-photo/close-up-cute-child-portrait_23-2149153273.jpg?t=st=1730272767~exp=1730276367~hmac=a9faba276a262d7c11c5ec2d5fb5cf4eb59f19f05a01945f3e015ee0aab6e31a&w=996',
            ColorManager.purple,
            NewPoductCleaningPage(),
            context),
        cardView2(
            'accrssories',
            'https://img.freepik.com/free-photo/beautiful-adorable-girl-celebrating-life_23-2149070453.jpg?t=st=1730272736~exp=1730276336~hmac=65bbc5418e8922a9284c7dac133a1457c5bb44f0a6ed4700adeced04d8c18c62&w=360',
            ColorManager.purple,
            NewProductAccessoriesPage(),
            context),
        cardView2(
            'porduct geniral',
            'https://img.freepik.com/free-photo/close-up-cute-child-portrait_23-2149153322.jpg?t=st=1730272797~exp=1730276397~hmac=33d7f7be10dd426440bb33948bb9983a6e389d57d19c05bb8bd60162e577bf59&w=360',
            ColorManager.purple,
            NewProductPage(),
            context),
      ],
    );
  }
}
