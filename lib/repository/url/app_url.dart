class AppUrl {
  static const String baseApi = "http://192.168.1.71:3000/api";
  // static const String baseApi = "http://192.168.102.142:3000/api";
  static const String signUpApi =
      "http://192.168.1.71:3000/api/users/createAccount";

  static const String loginApi = "http://192.168.1.71:3000/api/users/login";

  static const String userData = "$baseApi/users/login";
  static const String fetchProducts = "$baseApi/products";
  static const String fetchCartForUser = "$baseApi/cart";
}
