import 'package:ecommerce_elsafa_marwa_4/cubit/cubit.dart';
import 'package:ecommerce_elsafa_marwa_4/cubit/states.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/color_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/string_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/values_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/cubit/cubit.dart';
import 'package:ecommerce_elsafa_marwa_4/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_iconly/flutter_iconly.dart';

import '../presentation/share_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(name!,style: Theme.of(context).textTheme.bodyLarge,),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right:AppSize.s15),
                child: badges.Badge(
                  badgeAnimation: badges.BadgeAnimation.slide(
                    animationDuration: Duration(seconds: AppSize.si1),
                    colorChangeAnimationDuration: Duration(seconds: AppSize.si1),
                    curve: Curves.fastOutSlowIn,
                  ),
                  position: badges.BadgePosition.topEnd(),
                  badgeContent: Text('3',style: TextStyle(fontSize: AppSize.s10),),
                  child: Icon(Icons.shopping_cart_outlined,size: AppSize.s25,),
                ),
              )
            ],
          ),
          body: cubit.scrren[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.BottomItem,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },

          ),
        );
      },
    );
  }
}
