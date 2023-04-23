import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:booking_app/data/model/hotel_model.dart';
import 'package:booking_app/data/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
part 'hotel_search_event.dart';
part 'hotel_search_state.dart';

class HotelSearchBloc extends Bloc<HotelSearchEvent, HotelSearchState> {
  // List<HotelModel> hotels = [];
  HotelSearchBloc() : super(DashboardInitial()) {
    on<HotelSearchEvent>((event, emit) async {
      debugPrint('check Status');
      if (event is NavBack) {
        emit(DashboardNav());
      }
      if (event is Search) {
        debugPrint(
          'Search is done?${event.city}',
        );

        if (event.city.isEmpty) {
          emit(SearchFailure());
        } else {
          emit(SearchLoading());
          List<HotelModel> hotels = [];

          String? token = await CacheNetwork.getCacheData(key: 'token');
          debugPrint(' taking token: $token');

          Response response = await get(
              Uri.parse("http://10.0.2.2:9000/hotel/search?city=${event.city}"),
              headers: {
                'Authorization': 'Bearer $token',
              });
          debugPrint("${response.statusCode}");
          debugPrint(response.body);

          // loop list
          if (response.statusCode == 200) {
            var responseBody = jsonDecode(response.body);
            for (var item in responseBody) {
              hotels.add(HotelModel.fromJson(item));
            }
            debugPrint('Hotel List is: ${responseBody}');

            emit(SearchLoaded(hotelResponse: hotels));
          } else {
            emit(SearchFailure());
          }
        }
      }
    });
  }
}
