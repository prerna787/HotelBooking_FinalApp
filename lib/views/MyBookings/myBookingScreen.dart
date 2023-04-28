import 'package:booking_app/views/MyBookings/bloc/bookingApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../HotelSearch/bloc/hotel_search_bloc.dart';
import 'bloc/myBooking_bloc.dart';
import 'bloc/myBooking_event.dart';
import 'bloc/myBooking_state.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Bookings',
          ),
        ),
        body: BlocProvider(
          create: (context) =>
              BookingsBloc(bookingApi: BookingApi())..add(FetchBookings()),
          child: BlocConsumer<BookingsBloc, BookingsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is BookingsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BookingsLoaded) {
                return ListView.builder(
                  itemCount: state.bookings.length,
                  itemBuilder: (context, index) {
                    final booking = state.bookings[index];

                    return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Card(
                          elevation: 10.0,
                          // shadowColor: Colors.blueGrey,
                          color: (index % 2 == 0)
                              ? const Color.fromARGB(255, 237, 241, 243)
                              : const Color.fromARGB(255, 201, 201, 197),
                          child: SingleChildScrollView(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${booking.name}',
                                        style: const TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )
                                ])),
                          ),
                        ));
                  },
                );
              } else {
                return const Center(
                  child: Text('Nothing.'),
                );
              }
            },
          ),
        ));
  }
}
