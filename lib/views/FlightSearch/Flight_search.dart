import 'package:booking_app/presentation/components/loader.dart';
import 'package:booking_app/presentation/components/spacers.dart';
import 'package:booking_app/views/FlightSearch/bloc/flight_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightSearchScreen extends StatelessWidget {
  FlightSearchScreen({Key? key}) : super(key: key);
  final TextEditingController _fromCity = TextEditingController();
  final TextEditingController _toCity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Flights here!',
        ),
      ),
      body: BlocConsumer<FlightSearchBloc, FlightSearchState>(
        listener: (context, state) {
          if (state is SearchLoaded) {
            Navigator.of(context)
                .pushNamed('/flightList', arguments: state.flightResponse);
          } else if (state is NotFound) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Oops"),
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                    actionsOverflowButtonSpacing: 20,
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/searchFlight');
                        },
                        icon: const Icon(Icons.mood_bad),
                        alignment: Alignment.center,
                      ),
                    ],
                    content: const Text("No Match Found"),
                  );
                });
          }
        },
        builder: (context, state) {
          if (state is FlightLoading) {
            return LoadingWidget(
              child: initialLayout(context),
            );
          } else {
            return initialLayout(context);
          }
        },
      ),
    );
  }

  Widget initialLayout(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _fromCity,
                    decoration: const InputDecoration(
                      hintText: 'where',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _toCity,
                    decoration: const InputDecoration(
                      hintText: 'to',
                    ),
                  ),
                ),
              ],
            ),
            const HeightSpacer(myHeight: 10.00),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<FlightSearchBloc>(context)
                      .add(Search(_fromCity.text, _toCity.text));
                },
                child: const Text("Search")),
          ],
        ),
      );
}
