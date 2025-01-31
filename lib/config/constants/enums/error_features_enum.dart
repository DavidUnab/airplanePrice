enum ErrorFeaturesEnum {
  model(description: 'Campo Modelo (ID) vacio'),
  numEngines(description: 'Campo Número de motores vacio'),
  capacity(description: 'Campo Capacidad vacio'),
  age(description: 'Campo Años de uso vacio');

  final String description;

  const ErrorFeaturesEnum({required this.description});
}
