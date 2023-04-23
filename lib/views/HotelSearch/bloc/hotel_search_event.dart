part of 'hotel_search_bloc.dart';

abstract class HotelSearchEvent {}

class NavBack extends HotelSearchEvent {}

class Search extends HotelSearchEvent {
  late final String city;

  Search(this.city);
}
