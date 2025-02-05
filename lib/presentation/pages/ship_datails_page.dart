import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/models/ship.dart';
import 'package:flutter_application_2/presentation/pages/map_detail_page.dart';
import 'package:flutter_application_2/presentation/widgets/more_card.dart';
import 'package:flutter_application_2/presentation/widgets/ship_card.dart';

class ShipDetailsPage extends StatefulWidget {
  final Ship ship;

  const ShipDetailsPage({super.key, required this.ship});

  @override
  State<ShipDetailsPage> createState() => _ShipDetailsPageState();
}

class _ShipDetailsPageState extends State<ShipDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Ship Information'),
      ),
      body: Column(
        children: [
          ShipCard(
              ship: Ship(
                  model: widget.ship.model,
                  distance: widget.ship.distance,
                  fuelCapacity: widget.ship.fuelCapacity,
                  pricePerHour: widget.ship.pricePerHour)),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5)
                        ]),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Jane Cooper',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4,253',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MapsDetailsPage(ship: widget.ship)));
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 5)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/maps.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                    ship: Ship(
                        model: widget.ship.model + "-1",
                        distance: widget.ship.distance + 100,
                        fuelCapacity: widget.ship.fuelCapacity + 100,
                        pricePerHour: widget.ship.pricePerHour + 10)),
                SizedBox(
                  height: 5,
                ),
                MoreCard(
                    ship: Ship(
                        model: widget.ship.model + "-2",
                        distance: widget.ship.distance + 200,
                        fuelCapacity: widget.ship.fuelCapacity + 200,
                        pricePerHour: widget.ship.pricePerHour + 20)),
                SizedBox(
                  height: 5,
                ),
                MoreCard(
                    ship: Ship(
                        model: widget.ship.model + "-3",
                        distance: widget.ship.distance + 300,
                        fuelCapacity: widget.ship.fuelCapacity + 300,
                        pricePerHour: widget.ship.pricePerHour + 30)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
