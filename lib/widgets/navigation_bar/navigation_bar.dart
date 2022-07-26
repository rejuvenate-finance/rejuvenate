import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/routes.dart';
import '../../app/theme.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final items = ["Home", "Services", "Team", "DAPP"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 35.0),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        color: Colors.black.withOpacity(0.01),
        child: Row(
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
                width: 8.0,
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
                width: 8.0,
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
                width: 8.0,
                child: Divider(),
              ),
            ),
            TextButton.icon(
              onPressed: () =>
                  AppRouter.key.currentState?.pushNamed(AppRoutes.dashboard),
              label: Text(
                "APP",
                style: TextStyle(
                  color: AppTheme.dark.colorScheme.primary,
                ),
              ),
              icon: Icon(
                Icons.open_in_new,
                color: AppTheme.dark.colorScheme.primary,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  const _NavBarItem({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  // ignore: no_logic_in_create_state
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  Color? color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          color = Colors.black;
        });
      },
      onExit: (_) {
        setState(() {
          color = Colors.white;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
