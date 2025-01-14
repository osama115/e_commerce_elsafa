
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/share_component.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:carousel_slider/carousel_controller.dart' as carousel_slider;
import 'package:flutter/src/material/carousel.dart' as flutter_carousel;

class ExplorePage extends StatelessWidget {
   ExplorePage({super.key});
 var SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          formFiledcustomised(SearchController, '', TextInputType.text, IconlyBroken.search),
          SizedBox(height: AppSize.s20,),
       CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,

              ),
              items: imagList.map((item) => Container(
                child: Center(
                  child: Image.network(item, fit: BoxFit.cover, width: 1000),
                ),
              )).toList(),
            ),
        ],

      ),
    );
  }
}













// import 'package:ecommerce_elsafa_marwa_4/presentation/share_component.dart';
// import 'package:ecommerce_elsafa_marwa_4/presentation/string_manager.dart';
// import 'package:ecommerce_elsafa_marwa_4/presentation/values_manager.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class ExplorePage extends StatelessWidget {
//   ExplorePage({super.key});
//
//   var searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           formFiledcustomised(
//               searchController, '', TextInputType.text, Icons.search),
//           SizedBox(height: AppSize.s15,),
//           Text(AppString.dailyDiscount,style: Theme.of(context).textTheme.bodyMedium,),
//           SizedBox(height: AppSize.s30,),
//           Center(
//             child: CarouselSlider(
//               options: CarouselOptions(
//                 height: 200.0,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 aspectRatio: 16 / 9,
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enableInfiniteScroll: true,
//                 autoPlayAnimationDuration: Duration(milliseconds: 800),
//                 viewportFraction: 0.8,
//               ),
//               items: imagList.map((item) => Container(
//                 child: Center(
//                   child: Image.network(item, fit: BoxFit.cover, width: 1000),
//                 ),
//               )).toList(),
//             ),
//           ),
//           SizedBox(height: AppSize.s15,),
//           Text(AppString.categories,style: Theme.of(context).textTheme.bodyMedium,),
//           SizedBox(height: AppSize.s5,),
//           Row(
//             children: [
//               ListView()
//             ],
//           )
//
//         ],
//       ),
//     );
//   }
// }
