class Confg {
  static const String baseUrl = "http://10.0.2.2:3000/api";
  static const String mobileUrl = "http://192.168.1.100:3000/api";
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
  static const String tripInfo2 = "/tripInfo2/";
  static const String tripInfo3 = "/tripInfo3/";
  static const String itinerary = "/itenerary/";
  static const String optionalEvens="/OptionalEvents/";

  //attraction
  static const String attractionInfo2 = "/attractionInfo2/";
  static const String attractionInfo1 = "/attractionInfo1/";

  // destination
  static const String destinationInfo1="/destenationInfo1/";
  static const String destinationInfo3="/destenationInfo3/";
  static const String destinationInfo2="/destenationInfo2/";

  // reviews
  static const String destinationReviews="/destenation_review/";
  static const String attractionReviews = "/attraction_review/";
  static const String tripReviews = "/reviews_trip/";

  static const String destinationFullReviews="/destenation_full_review/";
  static const String attractionFullReviews = "/attraction_full_review/";
  static const String tripFullReviews = "/trip_full_review/";

  static const String destinationAddReviews="/destenation_review/";
  static const String attractionAddReviews = "/attraction_review/";
  static const String tripAddReviews = "/trip_review/";

  // weather
    static const String apiKey="UM5UVFHX57KP537TGZMM6DUW7";
    static String getWeatherUrl(double lat, double long){
      return "https://weather.visualcrossing.com/VisualCrossingWebSe"
          "rvices/rest/services/timeline/$lat,"
          "$long?key=$apiKey";
    }

    //currency
    static const String getAllCurrency="https://v6.exchangerate-api.com/v6/5db325c8151cb83b81554fc9/latest/USD";
}
