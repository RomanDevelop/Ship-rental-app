import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/data/datasources/firebase_ship_data_source.dart';
import 'package:flutter_application_2/data/repositories/ship_repository_impl.dart';
import 'package:flutter_application_2/domain/repositories/ship_repository.dart';
import 'package:flutter_application_2/domain/usecases/get_ships.dart';
import 'package:flutter_application_2/presentation/bloc/ship_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseShipDataSource>(
        () => FirebaseShipDataSource(firestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<ShipRepository>(
        () => ShipRepositoryImpl(getIt<FirebaseShipDataSource>()));
    getIt.registerLazySingleton<GetShips>(
        () => GetShips(getIt<ShipRepository>()));
    getIt.registerFactory(() => ShipBloc(getShips: getIt<GetShips>()));
  } catch (e) {
    rethrow;
  }
}
