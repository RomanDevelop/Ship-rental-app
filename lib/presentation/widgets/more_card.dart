import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/models/ship.dart';

class MoreCard extends StatelessWidget {
  final Ship ship;

  const MoreCard({super.key, required this.ship});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xff212020),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54, blurRadius: 8, offset: Offset(0, 4))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ship.model,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.directions_boat,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '> ${ship.distance} Miles',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.battery_full,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    ship.fuelCapacity.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 24,
          )
        ],
      ),
    );
  }
}
