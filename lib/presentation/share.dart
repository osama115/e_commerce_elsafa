import 'package:ecommerce_elsafa_marwa_4/cubit/cubit.dart';
import 'package:ecommerce_elsafa_marwa_4/model/user_model.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/share_component.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../model/product_model.dart';
import 'color_manager.dart';

// Widget cardView1(image, text1, text2, color,context) => InkWell(
//   onTap: (){navigateTo(context, DetailsPage());},
//       child: (Card(
//         color: color,
//         shape: RoundedRectangleBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(AppSize.s25)),
//           side: BorderSide(color: ColorManager.pink1, width: AppSize.s0_2),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(AppSize.s3),
//                 child: Container(
//                   width: AppSize.s190,
//                   height: AppSize.s170,
//                   margin: EdgeInsets.only(right: AppSize.s15),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(AppSize.s25),
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage(image),
//                       )),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(text1,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: ColorManager.white)), //title medum
//                     SizedBox(
//                       height: AppSize.s2,
//                     ),
//                     Container(
//                       child: Text(
//                         text2,
//                         maxLines: AppSize.s4,
//                         overflow: TextOverflow.clip,
//                         style:
//                             TextStyle(color: ColorManager.white), //body small
//                       ),
//                     )
//                   ]),
//             )
//           ],
//         ),
//       )),
//     );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: AppSize.s20),
      child: Container(
        width: double.infinity,
        height: AppSize.s1,
        color: ColorManager.grey300,
      ),
    );

Widget cardView(text1, text2, color) => InkWell(
      // onTap: (){navigateTo(context, DetailsPage());},
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          (Card(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s25)),
              side: BorderSide(color: ColorManager.pink1, width: AppSize.s0_2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSize.s30, horizontal: AppSize.s45),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white)), //title medum
                    SizedBox(
                      height: AppSize.s2,
                    ),
                    Container(
                      child: Text(
                        text2,
                        maxLines: AppSize.si2,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s50), //body small
                      ),
                    )
                  ]),
            ),
          )),
          Container(
            width: AppSize.s40,
            height: AppSize.s40,
            color: ColorManager.a,
            child: Icon(
              Icons.play_arrow,
              color: ColorManager.white,
              size: AppSize.s30,
            ),
          )
        ],
      ),
    );

Widget cardView2(name, image, color, place, context) => InkWell(
      onTap: () {
        navigateTo(context, place);
      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
          side: BorderSide(color: ColorManager.purple, width: AppSize.s0_4),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              height: AppSize.s120,
              width: double.infinity,
              padding: const EdgeInsets.all(AppSize.s16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s20),
                  image: DecorationImage(
                      image: NetworkImage('${image}'), fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: AppSize.s5,
          ),
          Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.white)), //title medum
          SizedBox(
            height: AppSize.s2,
          ),
        ]),
      ),
    );

Widget buildItem(ProductModel model, context, index ,name,quintaty,dateTime) => Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              height: AppSize.s120,
              width: double.infinity,
              padding: const EdgeInsets.all(AppSize.s16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  image: DecorationImage(
                      image: NetworkImage('${model.image}'),
                      fit: BoxFit.cover)),
              child: CircleAvatar(
                radius: AppSize.s18,
                backgroundColor: ColorManager.greyPurple,
                child: IconButton(
                  onPressed: () {},
                  iconSize: AppSize.s18,
                  alignment: Alignment.center,
                  color: ColorManager.white,
                  icon: const Icon(IconlyLight.heart),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: AppSize.s5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "\$${model.price}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            // TextSpan(text: "/${model.description}",
                            //   style: Theme.of(context).textTheme.bodySmall, ),
                          ],
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   iconSize: AppSize.s18,
                      //   alignment: Alignment.center,
                      //   icon: const Icon(Icons.add_shopping_cart_outlined),
                      // ),
                      CircleAvatar(
                          radius: AppSize.s18,
                          backgroundColor: ColorManager.red,
                          child: IconButton(
                              onPressed: () {
                                ShopCubit.get(context).addToCart(model);
                                // ShopCubit.get(context).product// uIdProduct: model.uId
                              },
                              alignment: Alignment.center,
                              iconSize: AppSize.s18,
                              color: ColorManager.white,
                              icon:
                                  const Icon(Icons.add_shopping_cart_outlined)))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
