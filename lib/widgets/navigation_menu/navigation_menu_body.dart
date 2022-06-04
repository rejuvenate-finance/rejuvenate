import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rejuvenate/app/routes.dart';

class NavigationMenuBody extends StatelessWidget {
  const NavigationMenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 16.0,
        ),
        _NavigationMenuItem(
          route: AppRoutes.home,
          icon: LineIcons.arrowLeft,
          title: "GO BACK",
        ),
        Divider(),
        _NavigationMenuItem(
          route: AppRoutes.dashboard,
          icon: Icons.dashboard,
          title: "Dashboard",
        ),
        _NavigationMenuItem(
          route: AppRoutes.staking,
          icon: LineIcons.layerGroup,
          title: "Staking",
        ),
        _NavigationMenuItem(
          route: AppRoutes.farms,
          icon: LineIcons.chalkboard,
          title: "Farms",
        ),
        _NavigationMenuItem(
          route: AppRoutes.rugRecovery,
          icon: LineIcons.handHoldingUsDollar,
          title: "Rug Recovery",
        ),
        Divider(),
        _NavigationMenuItem(
          route: AppRoutes.otc,
          icon: LineIcons.moneyCheck,
          title: "OTC Buys",
        ),
      ],
    );
  }
}

class _NavigationMenuItem extends StatelessWidget {
  const _NavigationMenuItem({
    Key? key,
    required this.icon,
    required this.route,
    this.title,
  }) : super(key: key);

  final IconData icon;
  final String route;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final isSelected = ModalRoute.of(context)!.settings.name == route;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
        color: isSelected ? color.withOpacity(0.24) : Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title ?? route,
          style: TextStyle(
            color: color,
          ),
        ),
        onTap: () => AppRouter.key.currentState?.pushNamed(route),
      ),
    );
  }
}
