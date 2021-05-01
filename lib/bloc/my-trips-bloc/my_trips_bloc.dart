import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pool_rides/models/my-trip.dart';
import 'package:pool_rides/models/user.dart';
import 'package:pool_rides/services/auth-service.dart';
import 'package:pool_rides/services/my-trip-service.dart';
import 'package:pool_rides/services/user-service.dart';

part 'my_trips_event.dart';
part 'my_trips_state.dart';

class MyTripsBloc extends Bloc<MyTripsEvent, MyTripsState> {
  MyTripsBloc() : super(MyTripsInitial());

  UserAuthProvider _authProvider = UserAuthProvider();
  static final UserService _userService = UserService();
  static final MyTripService _myTripService = MyTripService();
  User _myUser;

  @override
  Stream<MyTripsState> mapEventToState(
    MyTripsEvent event,
  ) async* {
    if (event is SearchMyTrips) {
      try {
        yield LoadingState();
        List<MyTrip> myTrips;
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          _myUser = await _userService.getCurrentUser(
            _authProvider.getUid(),
          );

          myTrips = await _myTripService.getMyTrips(_myUser);

          List<MyTrip> offlineMyTripList =
              myTrips.map((MyTrip e) => e.copyWith()).toList();
        }

        yield MyTripsFound(myTrips: myTrips, user: _myUser);
      } catch (e) {
        yield ErrorState(error: e.toString());
      }
    }
  }
}
