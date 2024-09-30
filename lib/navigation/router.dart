import 'package:camera_tutorials/screens/camera/camera_screen.dart';
import 'package:camera_tutorials/screens/home/home_screen.dart';
import 'package:camera_tutorials/screens/pose_detection/pose_detection_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter goRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'camera',
        path: '/camera',
        builder: (BuildContext context, GoRouterState state) {
          return const CameraScreen();
        },
      ),
      GoRoute(
        name: 'pose_detection',
        path: '/pose_detection',
        builder: (BuildContext context, GoRouterState state) {
          return const PoseDetectorView();
        },
      ),
    ],
  );
}
