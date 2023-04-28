import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:booking_app/data/model/hotel_model.dart';
import 'package:booking_app/data/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../data/model/flight_model.dart';
part 'flight_search_event.dart';
part 'flight_search_state.dart';

class FlightSearchBloc extends Bloc<FlightSearchEvent, FlightSearchState> {
  // List<HotelModel> hotels = [];
  FlightSearchBloc() : super(FlightInitial()) {
    on<FlightSearchEvent>((event, emit) async {
      debugPrint('check Status');
      if (event is NavBack) {
        emit(FlightNav());
      }
      if (event is Search) {
        debugPrint(
          'Search is done?${event.fromCity}',
        );

        if (event.fromCity.isEmpty && event.toCity.isEmpty) {
          emit(SearchFailure());
        } else {
          emit(SearchLoading());
          List<FlightModel> flights = [];

          String? token = await CacheNetwork.getCacheData(key: 'token');
          debugPrint(' taking token: $token');

          Response response = await get(
              Uri.parse(
                  "http://10.0.2.2:9090/flight/search?fromCity=${event.fromCity}&toCity=${event.toCity}"),
              headers: {
                'Authorization': 'Bearer $token',
              });
          debugPrint("${response.statusCode}");
          debugPrint(response.body);
          var responseBody = jsonDecode(response.body);
          for (var item in responseBody) {
            flights.add(FlightModel.fromJson(item));
          }

          // loop list
          if (response.statusCode == 200 && flights.isNotEmpty) {
            debugPrint('Flight List is: $responseBody');

            emit(SearchLoaded(flightResponse: flights));
          } else {
            emit(NotFound());
            emit(SearchFailure());
          }
        }
      }
    });
  }
}
