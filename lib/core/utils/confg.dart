class Confg {
  static const String baseUrl = "http://10.0.2.2:3000";
  static const String mobileUrl = "http://10.0.2.2:3000";
  static const String baseApiUrl = "http://10.0.2.2:3000/api";
  static const String mobileApiUrl = "http://192.168.1.101:3000/api";

//"http://192.168.1.102:3000/api";

  //  "http://10.65.11.34:3000";
  static const String registerUrl = "/register";
  static const String loginUrl = "/login";
  static const String checkcverificationCodeForgotpass =
      "/check_verification_code";
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
  static const String getFavorite = "/profile/favourites";
  static const String addDestinationFavouriteUrl =
      "/add_destenation_favourite/";
  static const String addTripFavouriteUrl = "/add_trip_favourite/";
  static const String addAttractionFavouriteUrl = "/add_attraction_favourite/";

  // trip
  static const String tripInfo1 = "/tripInfo1/";
  static const String tripInfo2 = "/tripInfo2/";
  static const String tripInfo3 = "/tripInfo3/";
  static const String itinerary = "/itenerary/";
  static const String optionalEvens = "/OptionalEvents/";

  //attraction
  static const String attractionInfo2 = "/attractionInfo2/";
  static const String attractionInfo1 = "/attractionInfo1/";

  // destination
  static const String destinationInfo1 = "/destenationInfo1/";
  static const String destinationInfo3 = "/destenationInfo3/";
  static const String destinationInfo2 = "/destenationInfo2/";

  // reviews
  static const String destinationReviews = "/destenation_review/";
  static const String attractionReviews = "/attraction_review/";
  static const String tripReviews = "/reviews_trip/";

  static const String destinationFullReviews = "/destenation_full_review/";
  static const String attractionFullReviews = "/attraction_full_review/";
  static const String tripFullReviews = "/trip_full_review/";

  static const String destinationAddReviews = "/destenation_review/";
  static const String attractionAddReviews = "/attraction_review/";
  static const String tripAddReviews = "/trip_review/";

  // weather
  static const String apiKey = "UM5UVFHX57KP537TGZMM6DUW7";
  static String getWeatherUrl(double lat, double long) {
    return "https://weather.visualcrossing.com/VisualCrossingWebSe"
        "rvices/rest/services/timeline/$lat,"
        "$long?key=$apiKey";
  }

  //currency
  static const String getAllCurrency =
      "https://v6.exchangerate-api.com/v6/5db325c8151cb83b81554fc9/latest/USD";

  // reservation
  static const String reservation = '/reservation/';

// profile
  static const String profileMain = '/profile/main';
  static const String profileInfo = '/profile/personal_information';
  static const String editProfile = '/EditMyProfile';
  //map
  static const String googleMapKey = "AIzaSyBfSxmU81EloKcv7r3ET";
  static String getLatLongApi(String address) {
    return "https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$googleGeocodingKey";
  }
  static String getAddressFromLatLong(double lat , double long){
    return
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$googleGeocodingKey";
  }
  static const String googleGeocodingKey =
      "AIzaSyBfSxmU81EloKcv7r3ET_69ciGIPlup9Dw";

// wallet

  static const String wallet = '/profile/wallet';

  static const String historyWallet = '/profile/wallet_history';

  static const String historyWalletId = "/profile/wallet_history/";
static const String chargeWallet = '/charge_wallet';

// ai chat
  static const String geminiApiKEY = 'AIzaSyB56tWY8pSDtt4UO5TyBYMvnXBESHxgruE';
  // notification
  static const String getNotificatio = "/Notifications";
  //images urls
  static const reservationImage="/reservation_trip_image/";
  static const tripImage = "/trip_single_image/";
  static const destinationImage = "/destination_single_image/";
  static const attractionImage = "/attraction_single_image/";
  static const allTripImages = "/all_trip_images/";
  static const allDestinationImages = "/all_destination_images/";
  static const allAttractionImages = "/all_attraction_images/";


////     books 
static const mybooks = "/personal_reservation";


/// reviews profile 

static const revivesProfile = "/profile/reviews";

  //search
  static const attractionSearch="/attraction_search?destination=";
  static const tripSearch="/search?destination=";

  //stripe
  static const stripeId="/stripe/customerId";
  static const checkPassword="/check_password";

  //delete account
  static const deleteAccount="/delete_account_request";

//log out 
static const logOut="/logout";
}
