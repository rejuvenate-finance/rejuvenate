import 'package:flutter/material.dart';
import 'package:rejuvenate/app/theme.dart';
import 'package:rejuvenate/widgets/navigation_menu/navigation_menu_body.dart';
import 'package:rejuvenate/widgets/quick_links/quick_links.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.dark.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            NavigationMenuBody(),
            Expanded(
              child: SizedBox(),
            ),
            QuickLinks(),
          ],
        ),
      ),
    );
  }
}
