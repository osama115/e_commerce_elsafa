import 'dart:ui';

import 'package:ecommerce_elsafa_marwa_4/presentation/color_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/string_manager.dart';
import 'package:ecommerce_elsafa_marwa_4/presentation/values_manager.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = ColorManager.white1,
  bool isUpperCase = true,
  double raduis = AppSize.s25,
  required VoidCallback function,
  required String text,
  Color textcolor =ColorManager.purple,
}) =>
    Container(
      // width: width,
      height: AppSize.s55,
      child: MaterialButton(
        onPressed: function,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s100),
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: textcolor,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: background,
      ),
    );

Widget defaultButtonCustomBlur({
  double width = double.infinity,
  Color background = ColorManager.offwhite,
  bool isUpperCase = true,
  double raduis = AppSize.s25,
  required VoidCallback function,
  required String text,
  Color textcolor =ColorManager.brownn,
}) =>
    Container(
      // width: width,
      height: AppSize.s55,
      child:  ClipRRect(
        borderRadius: BorderRadius.circular(raduis),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: AppSize.s5,sigmaY: AppSize.s5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s0,vertical: AppSize.s0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s10),
              color: ColorManager.white.withOpacity(AppSize.s0_2),
            ),
            child: OutlinedButton(
              onPressed: function,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s100),
                child: Text(
                  isUpperCase ? text.toUpperCase() : text,
                  style: TextStyle(
                    color: ColorManager.white,
                  ),
                ),
              ),
                style: ButtonStyle(
                  side: WidgetStateProperty.all(BorderSide(color:Color(0xffFFFFFF))),
                )
            ),

          ),
        ),
      ),

    );

Widget defaultButton2({
  double width = double.infinity,
  Color background = ColorManager.purple,
  bool isUpperCase = true,
  double raduis = AppSize.s25,
  required VoidCallback function,
  required String text,
  Color textcolor =ColorManager.offwhite,
}) =>
    Container(
      // width: width,
      height: AppSize.s55,
      child: MaterialButton(
        onPressed: function,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: textcolor,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: background,
      ),
    );

Widget defaultButton3({
  double width = double.infinity,
  // Color background = ColorManager.brownn,
  bool isUpperCase = false,
  double raduis = AppSize.s15,
  required VoidCallback function,
  required String text,
  Color textcolor =ColorManager.brownn,
  required ImageProvider? image,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: Container(
        // width: width,
        height: AppSize.s45,
        child: OutlinedButton(
          onPressed: function,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
            child: Row(
              children: [
                CircleAvatar(backgroundImage: image,radius: AppSize.s15,),
                SizedBox(width: AppSize.s10,),
                Text(
                  isUpperCase ? text.toUpperCase() : text,
                  style: TextStyle(
                    color: textcolor,
                  ),
                ),
              ],
            ),
          ),
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all<Color>(Color(0xff7E463E)),
            side: WidgetStateProperty.all(BorderSide(color:Color(0xff7E463E))),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis),
          // color: background,
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateBack(context, widget) => Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

Widget defualtFormField(
        {required TextEditingController controller,
        required TextInputType inputType,
        void Function(String)? onSubmit,
        void Function()? onTap,
        void Function(String)? onChanged,
        required final String? Function(String?)? validate,
        String? labelText,
        IconData? prefix,
        bool isPassword = false,
        IconData? suffix,
        void Function()? suffixPressed,
        bool isclickable = true}) =>
    TextFormField(
      controller: controller,
      enabled: isclickable,
      keyboardType: inputType,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        fillColor: ColorManager.brown,
        labelText: labelText,
        prefixIcon: Icon(prefix),
        suffix: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed,
        )
        : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.brownn, width: 2.0),
          borderRadius: BorderRadius.circular(AppSize.s22),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s22),
            borderSide: new BorderSide(color: ColorManager.brownn, width: 2.0)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(AppSize.s22),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.brownn, width: 2.0),
          // Border size for enabled state
          borderRadius: BorderRadius.circular(AppSize.s22),
        ),
      ),
    );

Widget defualtFormFieldCutomeForShopPurple(
        {required TextEditingController controller,
        required TextInputType inputType,
        void Function(String)? onSubmit,
        void Function()? onTap,
        void Function(String)? onChanged,
        required final String? Function(String?)? validate,
        String? labelText,
        IconData? prefix,
        bool isPassword = false,
        IconData? suffix,
        void Function()? suffixPressed,
        bool isclickable = true}) =>
    TextFormField(
      controller: controller,
      enabled: isclickable,
      keyboardType: inputType,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        fillColor: ColorManager.purple,
        labelText: labelText,
        prefixIcon: Icon(prefix,color: ColorManager.greyPurple,),
        suffix: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed,
        ) : null,
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: ColorManager.brownn, width: 2.0),
        //   borderRadius: BorderRadius.circular(AppSize.s22),
        // ),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(AppSize.s22),
        //     borderSide: new BorderSide(color: ColorManager.brownn, width: 2.0)),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 2.0),
        //   borderRadius: BorderRadius.circular(AppSize.s22),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: ColorManager.brownn, width: 2.0),
        //   // Border size for enabled state
        //   borderRadius: BorderRadius.circular(AppSize.s22),
        // ),
      ),
    );

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: ColorManager.white1),
      ),
    );

Widget formFiledcustomised(
  TextEditingController con,
  String text,
  TextInputType textInput,
    IconData? iconD,
) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$text',
            style: TextStyle(color: ColorManager.purple, fontSize: AppSize.s20),
          ),
          SizedBox(
            height: AppSize.s40,
            child: defualtFormField(
                controller: con,
                inputType: textInput,
                prefix: iconD,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return '$text must not be empty';
                  }
                }),
          ),
        ],
      ),
    );
Widget formFiledcustomised2(
  TextEditingController con,
  String text,
  TextInputType textInput,
    IconData? iconD,
    IconData? iconD2,
) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.s40,
            child: defualtFormField(
                controller: con,
                inputType: textInput,
                suffix: iconD2,
                prefix: iconD,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return '$text must not be empty';
                  }
                }),
          ),
        ],
      ),
    );

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: AppSize.s20,end: AppSize.s20),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
    child: Row(
      children: [
        Expanded(
          child: Container(
            // width: double.infinity,
            height: AppSize.s1_5,
            color: ColorManager.brown,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s18),
          child: Text('or',style: TextStyle(color: ColorManager.brown),),
        ),
        Expanded(
          child: Container(
            // width: double.infinity,
            height: AppSize.s1_5,
            color: ColorManager.brown,
          ),
        ),
      ],
    ),
  ),
);
String? name =AppString.shopApp;

final List<String> imagList =[
  'https://img.freepik.com/free-vector/square-food-banner_23-2148100718.jpg?t=st=1721912152~exp=1721915752~hmac=a325ba5c7158174582c094caab4862176a541db53f47f1def0539db707b96231&w=740',
  'https://img.freepik.com/free-vector/realistic-delicious-cupcake-sale-background_23-2149215188.jpg?t=st=1721912155~exp=1721915755~hmac=af587f48b1d691a852f146d366427a45d6cfb72299ee234190996f8bd50070b2&w=900',
  'https://img.freepik.com/free-vector/social-media-template-food-cake-design_483537-2239.jpg?t=st=1721912163~exp=1721915763~hmac=86e528ced24108ed6a89a2f29ab3db17d739e393b666e4cd166fe7e1d69451ea&w=740',
  'https://img.freepik.com/free-psd/we-love-macarons-menu-square-flyer-template_23-2148508797.jpg?w=740&t=st=1721912170~exp=1721912770~hmac=a58f8e7084026e3affefc038316527615a811fa854dda11fbe367fe2a74d7fd0',
  'https://img.freepik.com/free-psd/colourful-french-macarons-dish-sale_23-2148554330.jpg?w=1060&t=st=1721912176~exp=1721912776~hmac=1fa8916a7c691b97a6039363046f9545ec0d3cffc5f5eca5e111d09a09e30f3f',
  'https://img.freepik.com/free-vector/baked-cakes-poster_1284-15479.jpg?t=st=1721912179~exp=1721915779~hmac=d38f09cf1dcadfefa29782e9dc8f123da7300be27f00538566b0967d4100df4a&w=740',
];




// Widget listOfDesertCategories()=>SizedBox(
//   height:AppSize.s40  ,
//   child: ListView.separated(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context,index){
//         return Chip(
//           label: Text(touristPlaces[index].name),
//           avatar: CircleAvatar(
//             backgroundImage: AssetImage(touristPlaces[index].image),
//           ),
//           backgroundColor: ColorManager.white,
//           elevation: AppSize.s0_4,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)),
//         );
//
//       },
//       separatorBuilder: (context,index)=>
//           Padding(padding: EdgeInsets.only(right: AppPadding.p10)),
//       itemCount: touristPlaces.length
//   ),
// );

