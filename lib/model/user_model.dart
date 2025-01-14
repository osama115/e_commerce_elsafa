class UserModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? uId;
  String? image;
  bool? isEmailVerified;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.uId,
    this.image,
    this.isEmailVerified
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    name= json!["name"];
    email= json["email"];
    phone= json["phone"];
    password= json["password"];
    uId= json["uId"];
    image= json["image"];
    isEmailVerified= json["isEmailVerified"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "uId": uId,
      "image": image,
      "isEmailVerified": isEmailVerified,
    };
  }

}
