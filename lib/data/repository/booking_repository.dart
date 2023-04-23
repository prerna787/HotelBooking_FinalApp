import 'dart:convert';

import 'package:booking_app/data/model/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../local_storage.dart';

class BookingRepository{

  String bookingUrl="http://10.0.2.2:9000/booking/";
  Future<BookingModel> bookHotel(String username, String name,String hotelId) async {

    debugPrint('making request $username $name $hotelId');

    try {
      String? token = await CacheNetwork.getCacheData(key: 'token')  ;
      debugPrint(' taking token: $token');
      Response response = await post(
        Uri.parse(bookingUrl),
        body: json.encode({'username': username, 'name': name,'hotelId': hotelId}),
        headers: {
          "content-type" : "application/json",
          "accept" : "application/json",
          'Authorization': 'Bearer $token',
           },
      );
      debugPrint('Request Done${response.statusCode == 200}');

      if (response.statusCode == 200) {
        debugPrint(response.body);
        final result = jsonDecode(response.body) as Map<String, dynamic>;
        debugPrint('$result');
        debugPrint("Booking success and  username is : ${result ['username']}");

        return BookingModel.fromJson(data: result);

      } else {
        debugPrint('terminate ${response.reasonPhrase}');
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print('check the fault$e');
      rethrow;
    }
  }
}



