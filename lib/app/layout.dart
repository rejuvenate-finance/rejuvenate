import 'package:flutter/material.dart';
import 'package:rejuvenate/widgets/connect_button.dart/connect_button.dart';
import 'package:rejuvenate/widgets/rotated_navigation_bar/rotated_navigation_bar.dart';
import 'package:rejuvenate/widgets/navigation_menu/navigation_menu.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
        backgroundColor: Colors.transparent,
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
      extendBodyBehindAppBar: true,
      body: child,
    );
  }
}

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      endDrawer: const Drawer(
        width: 100.0,
        backgroundColor: Colors.transparent,
        child: RotatedNavigationBar(),
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: child,
      ),
    );
  }
}
