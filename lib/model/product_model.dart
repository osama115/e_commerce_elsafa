class ProductModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? description;
  String? price;
  bool? inFavorites;
  // bool? inCart;
  String? quintaty;

  ProductModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.description,
    this.price,
    this.inFavorites,
    // this.inCart,
    this.quintaty
  });

  ProductModel.fromJson(Map<String, dynamic>? json) {
    name= json!["name"];
    uId= json["uId"];
    image= json["image"];
    dateTime= json["dateTime"];
    description= json["description"];
    price= json["price"];
    inFavorites= json["inFavorites"];
    // inCart= json["inCart"];
    quintaty= json["quintaty"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "uId": uId,
      "image": image,
      "dateTime": dateTime,
      "description": description,
      "price": price,
      "inFavorites": inFavorites,
      // "inCart": inCart,
      "quintaty": quintaty,
    };
  }
}
