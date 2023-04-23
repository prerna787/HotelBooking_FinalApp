import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../data/local_storage.dart';
import '../../../data/repository/booking_repository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository bookingRepository;
  BookingBloc(this.bookingRepository) : super(BookingInitial()) {
    on<BookingEvent>((event, emit) async {
      if(event is SubmitForm){
        if(event.name.isEmpty||event.hotelId.isEmpty||event.userName.isEmpty){
          emit(FormFailure());
        }else{
          emit(FormLoading());
          var userResponse =
              await bookingRepository.bookHotel(event.userName, event.name, event.hotelId);
          debugPrint('Success ${userResponse.username}');
          await CacheNetwork.insertToCache(key: 'username',value:userResponse.username!);
          emit(FormLoaded(userResponse.username ?? ''));
        }
      }else {
        debugPrint('failed to login');
        emit(FormFailure()) ;

      }


    });
  }
}



