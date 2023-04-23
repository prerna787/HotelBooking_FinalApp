import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../data/local_storage.dart';
import '../../../data/model/booking_model.dart';

class BookingApi {
  Future<List<BookingModel>> getBookings() async {
    String? token = await CacheNetwork.getCacheData(key: 'token');
    debugPrint(' taking token: ${token}');
    final response = await http.get(
        Uri.parse('http://10.0.2.2:9000/booking/byUsername?username=ashish'),
        headers: {
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      debugPrint(response.body);
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => BookingModel.fromJson(data:json)).toList();
    } else {
      throw Exception('Failed to load bookings');
    }
  }
}
