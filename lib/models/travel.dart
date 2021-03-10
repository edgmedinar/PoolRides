import 'package:Pool_Rides/models/user.dart';
import 'package:flutter/foundation.dart';

class Travel {
  final String startTime;
  final String sourceName;
  final String sourceLocation;

  final String arrivalTime;
  final String destinyName;
  final String destinyLocation;

  final double priceTravel;
  final DateTime departureDate;

  final User driver;
  final List<User> passengers;
  Travel({
    @required this.driver,
    @required this.passengers,
    @required this.sourceLocation,
    @required this.destinyLocation,
    @required this.departureDate,
    @required this.startTime,
    @required this.arrivalTime,
    @required this.priceTravel,
    @required this.sourceName,
    @required this.destinyName,
  });
}
