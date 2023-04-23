import 'package:booking_app/data/model/hotel_model.dart';
import 'package:booking_app/views/Screens/hotell_details.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<HotelModel> hotelResponse;

  Result({Key? key, required this.hotelResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //${hotelResponse[index].id}'

    return Scaffold(
        appBar: AppBar(
          title: Text('Hotel List'),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: hotelResponse.length,
          itemBuilder: ((context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: (index % 2 == 0)
                       ? Color.fromARGB(255, 237, 241, 243)
                       : Color.fromARGB(255, 201, 201, 197)),
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(children: [

                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/details',
                                  arguments: hotelResponse[index]);
                            },
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(
                                  'Hotel id: ${hotelResponse[index].id}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Hotel name: ${hotelResponse[index].name}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'City: ${hotelResponse[index].city}',
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Price per Night: ${hotelResponse[index].pricePerNight}',
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
