part of 'flight_search_bloc.dart';

abstract class FlightSearchEvent {}

class NavBack extends FlightSearchEvent {}

class Search extends FlightSearchEvent {
  late final String fromCity;
  late final String toCity;

  Search(this.fromCity, this.toCity);
}
