import 'dart:ffi';

class BookingModel {
  String? username;
  String? name;
  int? hotelId;

  // Constructor
  BookingModel(
    this.username,
    this.name,
    this.hotelId,
  );

  // Named constructor
  BookingModel.fromJson({required Map<String, dynamic> data}) {
    // Refactoring Map | Json
    username = data['username'];
    name = data['name'];

    hotelId = data['hotelId'];
  }


  }
