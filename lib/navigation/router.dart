import 'package:camera_tutorials/screens/camera/camera_screen.dart';
import 'package:camera_tutorials/screens/home/home_screen.dart';
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
        routes: <RouteBase>[
          GoRoute(
            name: 'camera',
            path: 'camera',
            builder: (BuildContext context, GoRouterState state) {
              return const CameraScreen();
            },
          ),
        ],
      ),
    ],
  );
}
