abstract class FlightBookingState {}

class FlightBookingInitial extends FlightBookingState {}

class FormLoading extends FlightBookingState {}

class FormLoaded extends FlightBookingState {
  final String username;
  FormLoaded(this.username);
}

class FormFailure extends FlightBookingState {}

class EmptyFields extends FlightBookingState {}
