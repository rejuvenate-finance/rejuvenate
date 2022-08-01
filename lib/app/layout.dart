import 'package:flutter/material.dart';
import 'package:rejuvenate/app/theme.dart';
import 'package:rejuvenate/widgets/connect_button.dart/connect_button.dart';
import 'package:rejuvenate/widgets/navigation_menu/navigation_menu.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key, required this.title, required this.child})
      : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppTheme.dark.primaryColor,
        elevation: 0,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: ConnectButton(),
          ),
        ],
      ),
      drawer: const NavigationMenu(),
      extendBodyBehindAppBar: false,
      body: child,
    );
  }
}
