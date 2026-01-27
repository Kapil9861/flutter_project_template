// Router provider
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_template/common/screens/splash_screen.dart';
import 'package:project_template/core/auth_state.dart';
import 'package:project_template/core/providers/dio_provider.dart';
import 'package:project_template/core/router/route_names.dart';
import 'package:project_template/features/auth/presentation/screens/login_screen.dart';
import 'package:project_template/features/details/presentation/screens/details_screen.dart';
import 'package:project_template/features/home/presentation/screens/home_screen.dart';
import 'package:project_template/features/profile/presentation/screens/profile_screen.dart';
import 'package:project_template/features/settings/presentation/screens/settings_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final dioClient = ref.read(dioClientProvider);

  return GoRouter(
    navigatorKey: dioClient.alice.getNavigatorKey(),
    debugLogDiagnostics: true,
    initialLocation: RouteNames.splash,
    redirect: (context, state) {
      final isAuthenticated = authState;
      final isLoggingIn = state.matchedLocation == RouteNames.login;

      // Redirect to login if not authenticated
      if (!isAuthenticated && !isLoggingIn) {
        return RouteNames.login;
      }

      // Redirect to home if already authenticated and trying to access login
      if (isAuthenticated && isLoggingIn) {
        return RouteNames.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteNames.splash,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: RouteNames.login,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: RouteNames.details,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const DetailsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position:
                            Tween<Offset>(
                              begin: const Offset(0.3, 0),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ),
                            ),
                        child: child,
                      ),
                    );
                  },
            ),
          ),
        ],
      ),
      GoRoute(
        path: RouteNames.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: RouteNames.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text('Page not found: ${state.uri}')),
    ),
  );
});
