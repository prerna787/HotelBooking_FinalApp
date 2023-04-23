import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bookingApi.dart';
import 'myBooking_event.dart';
import 'myBooking_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final BookingApi bookingApi;

  BookingsBloc({required this.bookingApi}) : super(BookingsInitial()) {
    on<FetchBookings>((event, emit) async {
      emit(BookingsLoading());
      await Future.delayed(const Duration(milliseconds: 1000));
      debugPrint("booking Api is invoked...==========================?????");
      final bookings = await bookingApi.getBookings();
      emit(BookingsLoaded(bookings: bookings));
    });
  }
}
