import 'package:booking_app/presentation/components/loader.dart';
import 'package:booking_app/presentation/components/spacers.dart';
import 'package:booking_app/views/HotelSearch/bloc/hotel_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/components/declarations/constants/constants.dart';

class HotelSearchScreen extends StatelessWidget {
  HotelSearchScreen({Key? key}) : super(key: key);
  final TextEditingController _city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Hotels here!',
        ),
      ),
      body: BlocConsumer<HotelSearchBloc, HotelSearchState>(
        listener: (context, state) {
          if (state is SearchLoaded) {
            Navigator.of(context)
                .pushNamed('/list', arguments: state.hotelResponse);
          }
          ;
        },
        builder: (context, state) {
          if (state is DashboardLoading) {
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _city,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(  borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: kBorderRadius),
                        hintText: 'Enter your city ',labelText: 'Choose your Destination'
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const HeightSpacer(myHeight: 10.00),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<HotelSearchBloc>(context)
                      .add(Search(_city.text));
                },
                child: const Text("Search")),
          ],
        ),
      );
}
