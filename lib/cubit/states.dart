abstract class ShopStates{}
class ShopInatialStates extends ShopStates{}
class ShopLoadingStates extends ShopStates{}
class ShopErrorStates extends ShopStates{
  final String error;
  ShopErrorStates({required this.error});
}

class ShopChangeBottomNavStates extends ShopStates{}

class GetProductsLoadingState extends ShopStates{}
class GetProductsSuccessState extends ShopStates{}
class GetProductsErrorState extends ShopStates{
  final String error;
  GetProductsErrorState(this.error);
}
class AddProductsToCartLoadingState extends ShopStates{}
class AddProductsToCartSuccessState extends ShopStates{}
class AddProductsToCartErrorState extends ShopStates{
  final String error;
  AddProductsToCartErrorState(this.error);
}

// class FavoritePostSuccessState extends ShopStates{}
// class FavoritePostErrorState extends ShopStates{
//   final String error;
//   FavoritePostErrorState(this.error);
// }