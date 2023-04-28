part of 'hotel_search_bloc.dart';

@immutable
abstract class HotelSearchState {}

class DashboardInitial extends HotelSearchState {}

class DashboardLoading extends HotelSearchState {}

class DashboardNav extends HotelSearchState {}

class SearchLoading extends HotelSearchState {}

class SearchFailure extends HotelSearchState {}

class NotFound extends HotelSearchState {}

class SearchLoaded extends HotelSearchState {
  final List<HotelModel> hotelResponse;
  SearchLoaded({required this.hotelResponse});
  @override
  List<Object?> get props => [];
}

class FilterHotelsSuccessState extends HotelSearchState {}
