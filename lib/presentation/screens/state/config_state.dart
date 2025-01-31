import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_state.freezed.dart';

@freezed
class ConfigState with _$ConfigState {
  factory ConfigState({
    @Default('') String errorIp,
    @Default('') String errorPort,
  }) = _ConfigState;
}
