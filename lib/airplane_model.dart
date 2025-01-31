class AirplaneModel {
  final int model;
  final int numEngines;
  final int capacity;
  final int age;

  AirplaneModel({
    required this.model,
    required this.numEngines,
    required this.capacity,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'num_engines': numEngines,
      'capacity': capacity,
      'age': age,
    };
  }
}