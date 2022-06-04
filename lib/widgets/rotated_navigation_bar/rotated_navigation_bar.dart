import 'package:flutter/material.dart';
import 'package:rejuvenate/app/routes.dart';

class RotatedNavigationBar extends StatelessWidget {
  const RotatedNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
            onPressed: () =>
                AppRouter.key.currentState?.pushNamed(AppRoutes.home),
            child: Text(
              "HOME",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 32.0,
              child: Divider(),
            ),
          ),
          TextButton(
            onPressed: () =>
                AppRouter.key.currentState?.pushNamed(AppRoutes.services),
            child: Text(
              "SERVICES",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 32.0,
              child: Divider(),
            ),
          ),
          TextButton(
            onPressed: () =>
                AppRouter.key.currentState?.pushNamed(AppRoutes.team),
            child: Text(
              "TEAM",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 32.0,
              child: Divider(),
            ),
          ),
          TextButton.icon(
            onPressed: () =>
                AppRouter.key.currentState?.pushNamed(AppRoutes.dashboard),
            label: Text(
              "APP",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            icon: Icon(
              Icons.open_in_new,
              color: Theme.of(context).colorScheme.primary,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
