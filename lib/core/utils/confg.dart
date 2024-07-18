class Confg {
  static const String baseUrl = "http://10.0.2.2:3000/api";
  static const String mobileUrl = "http://192.168.137.210:3000/api";
//"http://192.168.1.102:3000/api"; 

  //  "http://10.65.11.34:3000";
  static const String registerUrl = "/register";
  static const String loginUrl = "/login";
  static const String checkcverificationCodeForgotpass = "/check_verification_code";
  static const String registerCode = "/regesteration_code";
  static const String forgotPasswordUrl = "/forget_password";
  static const String restPasswordUrl = "/reset_password";
//  static const header = {
//     'Authorization': 'Bearer $token',
//     'content-Type': 'application/json',
//   };
  //home
  static const String trendingDestinationsUrl = "/trending_destenation";
  static const String topAttractionsUrl = "/top_attractions";
  static const String popularAttractionsUrl = "/top_attractions";
  static const String topTrips = "/top_trips";
  static const String popularTrips = "/popular_trips";


  //favorite
  static const String addDestinationFavouriteUrl = "/add_destenation_favourite/";
  static const String addTripFavouriteUrl = "/add_trip_favourite/";
  static const String addAttractionFavouriteUrl = "/add_attraction_favourite/";


  // trip
  static const String tripInfo1 = "/tripInfo1/";


}
