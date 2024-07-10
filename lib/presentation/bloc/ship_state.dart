import 'package:flutter_application_2/data/models/ship.dart';

abstract class ShipState {}

class ShipsLoading extends ShipState {}

class ShipsLoaded extends ShipState {
  final List<Ship> ships;
  ShipsLoaded(this.ships);
}

class ShipsError extends ShipState {
  final String message;
  ShipsError(this.message);
}
