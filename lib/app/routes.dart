import 'package:flutter/material.dart';
import 'package:rejuvenate/data/team_member.dart';
import 'package:rejuvenate/views/dashboard/dashboard_view.dart';
import 'package:rejuvenate/views/farms/farms_view.dart';
import 'package:rejuvenate/views/home/home_view.dart';
import 'package:rejuvenate/views/rug_recovery/rug_recovery_view.dart';
import 'package:rejuvenate/views/staking/staking_view.dart';

abstract class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) =>
      _generateRoute(settings);
  static GlobalKey<NavigatorState> get key => _key;
}

Route<dynamic>? _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
        settings: settings,
      );
    case AppRoutes.dashboard:
      return MaterialPageRoute(
        builder: (context) => const DashboardView(),
        settings: settings,
      );
    case AppRoutes.staking:
      return MaterialPageRoute(
        builder: (context) => const StakingView(),
        settings: settings,
      );
    case AppRoutes.farms:
      return MaterialPageRoute(
        builder: (context) => const FarmsView(),
        settings: settings,
      );
    case AppRoutes.rugRecovery:
      return MaterialPageRoute(
        builder: (context) => const RugRecoveryView(),
        settings: settings,
      );
  }
  return null;
}

final _key = GlobalKey<NavigatorState>();

//ROUTES
abstract class AppRoutes {
  static const String home = "/";
  static const String dashboard = "/dashboard";
  static const String staking = "/staking";
  static const String farms = "/farms";
  static const String rugRecovery = "/rug-recovery";
}
