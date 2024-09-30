import 'package:camera_tutorials/screens/home/cubit/home_cubit.dart';
import 'package:camera_tutorials/screens/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..checkPermissions(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state.isCameraPermissionGranted &&
                state.isMicrophonePermissionGranted) {
              // context.goNamed('camera');
              context.goNamed('pose_detection');
            }
          },
          builder: (context, state) {
            if (state.status == StatsStatus.loaded) {
              if (state.isCameraPermissionGranted == false ||
                  state.isMicrophonePermissionGranted == false) {
                return _Permissions(
                  isCameraPermissionGranted: state.isCameraPermissionGranted,
                  isMicrophonePermissionGranted:
                      state.isMicrophonePermissionGranted,
                );
              }
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class _Permissions extends StatelessWidget {
  final bool isCameraPermissionGranted;
  final bool isMicrophonePermissionGranted;
  const _Permissions({
    required this.isCameraPermissionGranted,
    required this.isMicrophonePermissionGranted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Camera'),
          subtitle: const Text('Camera Permission'),
          secondary: const Icon(Icons.camera),
          value: isCameraPermissionGranted,
          onChanged: (newState) async {
            await context
                .read<HomeCubit>()
                .toggleCameraPermission(newState: newState);
          },
        ),
        SwitchListTile(
          title: const Text('Microphone'),
          subtitle: const Text('Microphone Permission'),
          secondary: const Icon(Icons.mic),
          value: isMicrophonePermissionGranted,
          onChanged: (newState) async {
            await context
                .read<HomeCubit>()
                .toggleMicrophonePermission(newState: newState);
          },
        )
      ],
    );
  }
}
