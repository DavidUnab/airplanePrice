class AirplanePredictionRequest {
  final int model;
  final int numEngines;
  final int capacity;
  final int age;

  AirplanePredictionRequest({
    required this.model,
    required this.numEngines,
    required this.capacity,
    required this.age,
  });
}
