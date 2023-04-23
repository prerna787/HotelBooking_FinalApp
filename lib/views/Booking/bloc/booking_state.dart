part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}
class FormLoading extends BookingState {}
class FormLoaded extends BookingState {
  final String username;
  FormLoaded(this.username);
}
class FormFailure extends BookingState {}
class EmptyFields extends BookingState {}

