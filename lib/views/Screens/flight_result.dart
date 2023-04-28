import 'package:booking_app/data/model/hotel_model.dart';
import 'package:booking_app/views/Screens/hotell_details.dart';
import 'package:flutter/material.dart';

import '../../data/model/flight_model.dart';

class FlightResult extends StatelessWidget {
  final List<FlightModel> flightResponse;

  const FlightResult({Key? key, required this.flightResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //${hotelResponse[index].id}'

    return Scaffold(
        appBar: AppBar(
          title: const Text('Flight List'),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: flightResponse.length,
          itemBuilder: ((context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromARGB(255, 47, 222, 187),
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/flightdetails',
                                  arguments: flightResponse[index]);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Flight id: ${flightResponse[index].flightId}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Flight name: ${flightResponse[index].flightName}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'where: ${flightResponse[index].fromCity}',
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'to : ${flightResponse[index].toCity}',
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'on : ${flightResponse[index].date}',
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ])),
                  ),
                ));
          }),
        )));
  }
}
