class Parameters {
  static const String configTitle = 'Configuración del Servidor';
  static const String configIpServer = 'IP del servidor';
  static const String configPortServer = 'Puerto';
  static const String saveTitleButton = 'Guardar y continuar';
  static const String predictionTitle = 'Predicción de Precio';
  static const String predictionModelTitle = 'Modelo avion';
  static const String predictionModelHint = 'Selecciona el Modelo de Avion';
  static const String predictionNumEnginesTitle = 'Número de motores';
  static const String predictionCapacityTitle = 'Capacidad';
  static const String predictionAgeTitle = 'Años de uso';
  static const String missingServerParameters = 'Faltan parametros del server';
  static const String predictTitleButton = 'Predecir';
  static const String predictResult = 'Predicción del precio';

  static const int minValueNumEngines = 1;
  static const int maxValueNumEngines = 2;
  static const int minValueCapacity = 4;
  static const int maxValueCapacity = 396;
  static const int minValueAge = 0;
  static const int maxValueAge = 43;
  static const String empty = '';

  static const String descriptionRangeNumEngines =
      'Ingrese un valor entre $minValueNumEngines y $maxValueNumEngines';

  static const String descriptionCapacity =
      'Ingrese un valor entre $minValueCapacity y $maxValueCapacity';

  static const String descriptionAge =
      'Ingrese un valor entre $minValueAge y $maxValueAge';
}
