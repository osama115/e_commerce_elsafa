import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_elsafa_marwa_4/cubit/cubit.dart';
import 'package:ecommerce_elsafa_marwa_4/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../cubit/states.dart';
import '../../presentation/color_manager.dart';
import '../../presentation/share.dart';
import '../../presentation/string_manager.dart';
import '../../presentation/values_manager.dart';

class NewPoductCleaningPage extends StatelessWidget {
  const NewPoductCleaningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => ShopCubit()..getNewProductCleanning(),
        child: BlocConsumer<ShopCubit, ShopStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            return ConditionalBuilder(
              condition: ShopCubit.get(context).products.length > AppSize.s0,
              // && ShopCubit.get(context).userModel != null,
              builder: (BuildContext context) => SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppSize.s8),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => buildItem(
                            ShopCubit.get(context).products[index],
                            context,
                            index,
                        ProductModel().name,
                        ProductModel().quintaty,
                        DateTime.now().toString()),
                        itemCount: ShopCubit.get(context).products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: AppSize.si2,
                                crossAxisSpacing: AppSize.s10,
                                //mainAxisExtent: AppSize.s10,
                                childAspectRatio: AppSize.s0_9),
                        // separatorBuilder: (context, index) => SizedBox(
                        //   height: AppSize.s8,
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s8,
                    ),
                  ],
                ),
              ),
              fallback: (BuildContext context) =>
                  Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
