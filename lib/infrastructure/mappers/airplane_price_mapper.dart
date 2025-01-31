import 'package:airplane_price/infrastructure/models/request/airplane_prediction_request.dart';
import 'package:airplane_price/infrastructure/models/response/airplane_prediction_response.dart';

class AirplanePredictionMapper {
  static Map<String, dynamic> fromAirplanePredictionRequestToRequest(
    AirplanePredictionRequest request,
  ) {
    return {
      "model": request.model,
      "num_engines": request.numEngines,
      "capacity": request.capacity,
      "age": request.age,
    };
  }

  static AirplanePredictionResponse fromMapToAirplanePredictionResponse(
    Map<String, dynamic> response,
  ) {
    return AirplanePredictionResponse(price: response['predicted_price']);
  }
}
