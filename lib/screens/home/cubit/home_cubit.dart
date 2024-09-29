import 'package:bloc/bloc.dart';
import 'package:camera_tutorials/screens/home/cubit/home_state.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> checkPermissions() async {
    emit(state.copyWith(status: StatsStatus.loading));
    var cameraPermissionStatus = await Permission.camera.status;
    var microphonePermissionStatus = await Permission.microphone.status;

    emit(
      HomeState(
        isCameraPermissionGranted: cameraPermissionStatus.isGranted,
        isMicrophonePermissionGranted: microphonePermissionStatus.isGranted,
        status: StatsStatus.loaded,
      ),
    );
  }

  Future<void> toggleCameraPermission({required bool newState}) async {
    if (newState) {
      final status = await Permission.camera.request();
      debugPrint('$status');
      emit(state.copyWith(isCameraPermissionGranted: status.isGranted));
    } else {
      emit(state.copyWith(isCameraPermissionGranted: newState));
    }
  }

  Future<void> toggleMicrophonePermission({required bool newState}) async {
    if (newState) {
      final status = await Permission.microphone.request();
      debugPrint('$status');
      emit(state.copyWith(isMicrophonePermissionGranted: status.isGranted));
    } else {
      emit(state.copyWith(isMicrophonePermissionGranted: newState));
    }
  }
}
