// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predicted_price_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PredictedPriceState {
  String get predictedPrice => throw _privateConstructorUsedError;
  bool get showLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PredictedPriceStateCopyWith<PredictedPriceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictedPriceStateCopyWith<$Res> {
  factory $PredictedPriceStateCopyWith(
          PredictedPriceState value, $Res Function(PredictedPriceState) then) =
      _$PredictedPriceStateCopyWithImpl<$Res, PredictedPriceState>;
  @useResult
  $Res call({String predictedPrice, bool showLoading});
}

/// @nodoc
class _$PredictedPriceStateCopyWithImpl<$Res, $Val extends PredictedPriceState>
    implements $PredictedPriceStateCopyWith<$Res> {
  _$PredictedPriceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedPrice = null,
    Object? showLoading = null,
  }) {
    return _then(_value.copyWith(
      predictedPrice: null == predictedPrice
          ? _value.predictedPrice
          : predictedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      showLoading: null == showLoading
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictedPriceStateImplCopyWith<$Res>
    implements $PredictedPriceStateCopyWith<$Res> {
  factory _$$PredictedPriceStateImplCopyWith(_$PredictedPriceStateImpl value,
          $Res Function(_$PredictedPriceStateImpl) then) =
      __$$PredictedPriceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String predictedPrice, bool showLoading});
}

/// @nodoc
class __$$PredictedPriceStateImplCopyWithImpl<$Res>
    extends _$PredictedPriceStateCopyWithImpl<$Res, _$PredictedPriceStateImpl>
    implements _$$PredictedPriceStateImplCopyWith<$Res> {
  __$$PredictedPriceStateImplCopyWithImpl(_$PredictedPriceStateImpl _value,
      $Res Function(_$PredictedPriceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedPrice = null,
    Object? showLoading = null,
  }) {
    return _then(_$PredictedPriceStateImpl(
      predictedPrice: null == predictedPrice
          ? _value.predictedPrice
          : predictedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      showLoading: null == showLoading
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PredictedPriceStateImpl implements _PredictedPriceState {
  _$PredictedPriceStateImpl(
      {this.predictedPrice = "", this.showLoading = false});

  @override
  @JsonKey()
  final String predictedPrice;
  @override
  @JsonKey()
  final bool showLoading;

  @override
  String toString() {
    return 'PredictedPriceState(predictedPrice: $predictedPrice, showLoading: $showLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictedPriceStateImpl &&
            (identical(other.predictedPrice, predictedPrice) ||
                other.predictedPrice == predictedPrice) &&
            (identical(other.showLoading, showLoading) ||
                other.showLoading == showLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, predictedPrice, showLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictedPriceStateImplCopyWith<_$PredictedPriceStateImpl> get copyWith =>
      __$$PredictedPriceStateImplCopyWithImpl<_$PredictedPriceStateImpl>(
          this, _$identity);
}

abstract class _PredictedPriceState implements PredictedPriceState {
  factory _PredictedPriceState(
      {final String predictedPrice,
      final bool showLoading}) = _$PredictedPriceStateImpl;

  @override
  String get predictedPrice;
  @override
  bool get showLoading;
  @override
  @JsonKey(ignore: true)
  _$$PredictedPriceStateImplCopyWith<_$PredictedPriceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
