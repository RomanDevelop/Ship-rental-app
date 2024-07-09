import 'package:flutter_application_2/data/models/ship.dart';

abstract class ShipRepository {
  Future<List<Ship>> fetchShips();
}
