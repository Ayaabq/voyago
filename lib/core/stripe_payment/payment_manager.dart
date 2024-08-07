// import 'package:dio/dio.dart';
// import 'package:voyago/core/domain/services/api_imp.dart';
// import 'package:voyago/core/utils/services_locater.dart';
//
// import '../domain/services/api.dart';
//
// abstract class PaymentManager {
//   Future<void> makePayment(int amount, String currency){
//     String clientSecret=;
//   }
//
//   Future<String> _getClientSecret() async{
//     ApiServices api=getIt.get<ApiServicesImp>();
//    await api.post(
//
//    );
//
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:voyago/core/stripe_payment/stripe_keys.dart';


abstract class PaymentManager{

  static Future<void>makePayment(int amount,String currency)async{
    try {
      String clientSecret=await _getClientSecret((amount*100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void>_initializePaymentSheet(String clientSecret)async{
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Basel",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount,String currency)async{
    Dio dio=Dio();
    var response= await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
        'customer':'cus_QcP2lcElSrBIQm'
      },
    );
    print(response.toString());
    return response.data["client_secret"];
  }

}