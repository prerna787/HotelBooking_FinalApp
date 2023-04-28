import 'package:bloc/bloc.dart';
import 'package:booking_app/views/FlightBookingBloc/flight_booking_event.dart';
import 'package:booking_app/views/FlightBookingBloc/flight_booking_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../data/local_storage.dart';
import '../../../data/repository/booking_repository.dart';

class FlightBookingBloc extends Bloc<FlightBookingEvent, FlightBookingState> {
  final BookingRepository bookingRepository;
  FlightBookingBloc(this.bookingRepository) : super(FlightBookingInitial()) {
    on<FlightBookingEvent>((event, emit) async {
      if (event is SubmitForm) {
        if (event.name.isEmpty ||
            event.flightId.isEmpty ||
            event.userName.isEmpty) {
          emit(FormFailure());
        } else {
          emit(FormLoading());
          var userResponse = await bookingRepository.bookFlight(
              event.userName, event.name, event.flightId);
          debugPrint('Success ${userResponse.username}');
          await CacheNetwork.insertToCache(
              key: 'username', value: userResponse.username!);
          emit(FormLoaded(userResponse.username ?? ''));
        }
      } else {
        debugPrint('failed to login');
        emit(FormFailure());
      }
    });
  }
}
