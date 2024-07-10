import 'package:flutter_application_2/domain/usecases/get_ships.dart';
import 'package:flutter_application_2/presentation/bloc/ship_event.dart';
import 'package:flutter_application_2/presentation/bloc/ship_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShipBloc extends Bloc<ShipEvent, ShipState> {
  final GetShips getShips;

  ShipBloc({required this.getShips}) : super(ShipsLoading()) {
    on<LoadShips>((event, emit) async {
      emit(ShipsLoading());
      try {
        final ships = await getShips.call();
        emit(ShipsLoaded(ships));
      } catch (e) {
        emit(ShipsError(e.toString()));
      }
    });
  }
}
