import 'package:flutter_application_2/data/models/ship.dart';
import 'package:flutter_application_2/domain/repositories/ship_repository.dart';

class GetShips {
  final ShipRepository repository;

  GetShips(this.repository);

  Future<List<Ship>> call() async {
    return await repository.fetchShips();
  }
}
