part of 'flight_search_bloc.dart';

@immutable
abstract class FlightSearchState {}

class FlightInitial extends FlightSearchState {}

class FlightLoading extends FlightSearchState {}

class FlightNav extends FlightSearchState {}

class SearchLoading extends FlightSearchState {}

class SearchFailure extends FlightSearchState {}
class NotFound extends FlightSearchState {}

class SearchLoaded extends FlightSearchState {
  final List<FlightModel> flightResponse;
  SearchLoaded({required this.flightResponse});
  @override
  List<Object?> get props => [];
}

class FilterFlightsSuccessState extends FlightSearchState {}
