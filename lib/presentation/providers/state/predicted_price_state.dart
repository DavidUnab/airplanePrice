import 'package:freezed_annotation/freezed_annotation.dart';

part 'predicted_price_state.freezed.dart';

@freezed
class PredictedPriceState with _$PredictedPriceState {
  factory PredictedPriceState({
    @Default("") String predictedPrice,
    @Default(false) bool showLoading,
  }) = _PredictedPriceState;
}