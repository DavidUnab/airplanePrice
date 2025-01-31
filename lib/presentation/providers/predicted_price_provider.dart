import 'package:airplane_price/config/parameters/parameters.dart';
import 'package:airplane_price/presentation/providers/state/predicted_price_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'predicted_price_provider.g.dart';

@Riverpod(keepAlive: true)
class PredictedPrice extends _$PredictedPrice {
  @override
  PredictedPriceState build() => PredictedPriceState();

  void setPrice(String price) {
    state = PredictedPriceState(predictedPrice: price);
  }

  void setIsLoading(bool value) {
    state = PredictedPriceState(showLoading: value);
  }

  void clearPrice() {
    state = PredictedPriceState(predictedPrice: Parameters.empty);
  }
}
