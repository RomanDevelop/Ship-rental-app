class Ship {
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Ship({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  factory Ship.fromMap(Map<String, dynamic> map) {
    return Ship(
      model: map['model'],
      distance: (map['distance'] as num).toDouble(),
      fuelCapacity: (map['fuelCapacity'] as num).toDouble(),
      pricePerHour: (map['pricePerHour'] as num).toDouble(),
    );
  }
}
