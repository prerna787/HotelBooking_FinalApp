import 'package:booking_app/data/repository/booking_repository.dart';
import 'package:booking_app/data/repository/user_repository.dart';
import 'package:booking_app/views/Booking/bloc/booking_bloc.dart';
import 'package:booking_app/views/MyBookings/bloc/myBooking_bloc.dart';
import 'package:booking_app/views/MyBookings/myBookingScreen.dart';
import 'package:booking_app/views/Screens/dashboard_screen.dart';
import 'package:booking_app/views/Screens/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:booking_app/views/HotelSearch/bloc/hotel_search_bloc.dart';
import 'package:booking_app/views/Login/bloc/auth_bloc.dart';
import 'package:booking_app/views/Login/login.dart';

import '../../../data/model/hotel_model.dart';
import '../../../views/MyBookings/bloc/bookingApi.dart';
import '../../../views/HotelSearch/hotel_search.dart';
import '../../../views/Screens/hotell_details.dart';

class RouteGenerator {
  final AuthBloc _authBloc = AuthBloc(UserRepository());
  final HotelSearchBloc _dashboardBloc = HotelSearchBloc();
  final BookingBloc _bookingBloc = BookingBloc(BookingRepository());
  final BookingsBloc _myBloc = BookingsBloc(bookingApi: BookingApi());
  Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthBloc>.value(
            value: _authBloc,
            child: const MyHomePage(title: "Booking App"),
          ),
        );

      case '/dashboardScreen':
        return MaterialPageRoute(
          builder: (_) => DashboardScreen(),
        );

      case '/searchHotel':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HotelSearchBloc>.value(
            value: _dashboardBloc,
            child: HotelSearchScreen(),
          ),
        );

      case '/list':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HotelSearchBloc>.value(
            value: _dashboardBloc,
            child: Result(hotelResponse: args as List<HotelModel>),
          ),
        );

      case '/details':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BookingBloc>.value(
            value: _bookingBloc,
            child: HotelDetails(hotelModel: args as HotelModel),
          ),
        );

      case '/myBookings':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BookingsBloc>.value(
            value: _myBloc,
            child: const MyBookingsScreen(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR IN NAVIGATION'),
        ),
      );
    });
  }
}
