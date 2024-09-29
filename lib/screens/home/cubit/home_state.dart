import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

enum StatsStatus { loading, loaded }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isCameraPermissionGranted,
    @Default(false) bool isMicrophonePermissionGranted,
    @Default(StatsStatus.loading) StatsStatus status,
  }) = _HomeState;
}
