enum AirplaneModelsEnum {
  airbusA320(description: 'Airbus A320', id: 0),
  airbusA350(description: 'Airbus A350', id: 1),
  boeing737(description: 'Boeing 737', id: 2),
  boeing777(description: 'Boeing 777', id: 3),
  bombardierCRJ200(description: 'Bombardier CRJ200', id: 4),
  cessna(description: 'Cessna 172', id: 5);

  final String description;
  final int id;

  const AirplaneModelsEnum({required this.description, required this.id});

  static List<String> getDescriptions() {
    List<AirplaneModelsEnum> models = AirplaneModelsEnum.values.toList();
    models.sort((a, b) => a.id.compareTo(b.id));
    List<String> descriptions =
        models.map((model) => model.description).toList();
    return descriptions;
  }

  static int? getIdByDescription(String description) {
    for (AirplaneModelsEnum model in AirplaneModelsEnum.values) {
      if (model.description == description) {
        return model.id;
      }
    }
    return null;
  }
}
