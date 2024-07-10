import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/models/ship.dart';
import 'package:flutter_application_2/presentation/bloc/ship_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/ship_state.dart';
import 'package:flutter_application_2/presentation/widgets/ship_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShipListScreen extends StatelessWidget {
  final List<Ship> ships = [
    Ship(
        model: 'Eemslift Nelli',
        distance: 870,
        fuelCapacity: 15,
        pricePerHour: 450),
    Ship(
        model: 'Eemslift Helen',
        distance: 870,
        fuelCapacity: 15,
        pricePerHour: 450),
    Ship(
        model: 'Eemslift Hendrik',
        distance: 870,
        fuelCapacity: 15,
        pricePerHour: 450),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Ship'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      // body: ListView.builder(
      //     itemCount: ships.length,
      //     itemBuilder: (context, index) {
      //       return ShipCard(ship: ships[index]);
      //     }),
      body: BlocBuilder<ShipBloc, ShipState>(
        builder: (context, state) {
          if (state is ShipsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ShipsLoaded) {
            return ListView.builder(
              itemCount: state.ships.length,
              itemBuilder: (context, index) {
                return ShipCard(ship: state.ships[index]);
              },
            );
          } else if (state is ShipsError) {
            return Center(
              child: Text('error : ${state.message}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
