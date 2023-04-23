import '../../../data/model/booking_model.dart';

class BookingsState {}

class BookingsInitial extends BookingsState {}

class BookingsLoading extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<BookingModel> bookings;

  BookingsLoaded({required this.bookings});
}

class BookingsError extends BookingsState {
  final String message;

  BookingsError({required this.message});
}
