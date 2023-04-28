abstract class FlightBookingEvent {}

class SubmitForm extends FlightBookingEvent {
  final String userName;
  final String name;
  final String flightId;

  SubmitForm(
      {required this.userName, required this.flightId, required this.name});
}
