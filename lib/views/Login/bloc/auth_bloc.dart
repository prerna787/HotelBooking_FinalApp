import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/data/local_storage.dart';

import 'package:booking_app/data/repository/user_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  late String token ='';

  AuthBloc(
    this.userRepository,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is Login) {
        if (event.userName.isEmpty || event.password.isEmpty) {
          emit(AuthError());
        } else {
          emit(AuthLoading());
          try {
            var userResponse =
            await userRepository.loginUser(event.userName, event.password);
            debugPrint('Success ${userResponse.username}');
            // TODO : adding token after reponse is successful "Secure Storage"
            // save cache

            await CacheNetwork.insertToCache(
                key: 'token', value: userResponse.token!);
            debugPrint(await CacheNetwork.getCacheData(key: 'token'));
            await CacheNetwork.insertToCache(
                key: 'username', value: userResponse.username!);
            debugPrint(await CacheNetwork.getCacheData(key: 'username'));
            emit(AuthLoaded(userResponse.username ?? ''));
          }catch(e){
            emit(AuthError()) ;
            debugPrint('hereis s an exception ${e.toString()}');
          }
        }

      }else {
        debugPrint('failed to login');
        emit(AuthError()) ;

      }
    });
  }
}
