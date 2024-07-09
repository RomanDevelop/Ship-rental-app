import 'package:flutter_application_2/data/datasources/firebase_ship_data_source.dart';
import 'package:flutter_application_2/data/models/ship.dart';
import 'package:flutter_application_2/domain/repositories/ship_repository.dart';

class ShipRepositoryImpl implements ShipRepository {
  final FirebaseShipDataSource dataSource;

  ShipRepositoryImpl(this.dataSource);

  @override
  Future<List<Ship>> fetchShips() {
    return dataSource.getShips();
  }
}
