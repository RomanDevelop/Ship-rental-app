import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/models/ship.dart';
import 'package:flutter_application_2/presentation/widgets/ship_card.dart';

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
      body: ListView.builder(
          itemCount: ships.length,
          itemBuilder: (context, index) {
            return ShipCard(ship: ships[index]);
          }),
      // body: BlocBuilder<CarBloc, CarState>(
      //   builder: (context, state){
      //     if(state is CarsLoading){
      //       return Center(child: CircularProgressIndicator(),);
      //     }
      //     else if(state is CarsLoaded) {
      //       return ListView.builder(
      //         itemCount: state.cars.length,
      //         itemBuilder: (context, index){
      //           return CarCard(car: state.cars[index]);
      //         },
      //       );
      //     }
      //     else if(state is CarsError) {
      //       return Center(child: Text('error : ${state.message}'),);
      //     }
      //     return Container();
      //   },
      // ),
    );
  }
}
