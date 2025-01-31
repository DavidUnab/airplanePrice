import 'package:airplane_price/config/networking/api_service.dart';
import 'package:airplane_price/config/parameters/parameters.dart';
import 'package:airplane_price/config/utils/converter_util.dart';
import 'package:airplane_price/infrastructure/models/request/airplane_prediction_request.dart';
import 'package:airplane_price/infrastructure/models/response/airplane_prediction_response.dart';
import 'package:airplane_price/presentation/providers/api_url_provider.dart';
import 'package:airplane_price/presentation/providers/predicted_price_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PredictionUseCase {
  final WidgetRef _ref;

  PredictionUseCase({required WidgetRef ref}) : _ref = ref;

  validateApiRest(AirplanePredictionRequest request) async {
    String server = _ref.read(apiUrlProvider);
    if (server.isNotEmpty) {
      _ref.read(predictedPriceProvider.notifier).setIsLoading(true);

      ApiService apiService = ApiService(server);
      final Either<String, AirplanePredictionResponse> result =
      await apiService.predictPrice(request);

      await Future.delayed(const Duration(seconds: 2));

      result.fold(
            (String failure) {
          _ref.read(predictedPriceProvider.notifier).setIsLoading(false);
          notifyError(failure);
        },
            (AirplanePredictionResponse response) {
          _ref.read(predictedPriceProvider.notifier).setIsLoading(false);
          double priceUsd = response.price;
          String priceFormated = ConverterUtil.formatPrice(priceUsd);
          _ref.read(predictedPriceProvider.notifier).setPrice(priceFormated);
        },
      );
    } else {
      notifyError(Parameters.missingServerParameters);
    }
  }

  void notifyError(String error) {
    _ref.read(predictedPriceProvider.notifier).setPrice("Error: $error");
  }
}
