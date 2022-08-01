import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rejuvenate/app/routes.dart';
import 'package:rejuvenate/app/theme.dart';
import 'package:rejuvenate/widgets/footer/footer.dart';
import 'package:rejuvenate/widgets/home_text/home_text.dart';
import 'package:rejuvenate/widgets/quick_links/quick_links.dart';
import 'package:rejuvenate/widgets/section/section.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:math' as math;

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return Scaffold(
      body: ListView(
        controller: scrollController,
        cacheExtent: 0,
        addRepaintBoundaries: true,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Theme(
              data: AppTheme.dark,
              child: Stack(
                children: [
                  Entry.opacity(
                    duration: const Duration(milliseconds: 300),
                    child: Transform.translate(
                      offset:
                          Offset(-MediaQuery.of(context).size.width * 0.5, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: const [
                              0.1,
                              0.8,
                            ],
                            colors: [
                              AppTheme.dark.colorScheme.onPrimary,
                              AppTheme.dark.colorScheme.primary,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Entry.opacity(
                    duration: const Duration(milliseconds: 300),
                    child: Transform.translate(
                      offset:
                          Offset(MediaQuery.of(context).size.width * 0.5, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: const [
                              0.1,
                              0.8,
                            ],
                            colors: [
                              AppTheme.dark.colorScheme.onPrimary,
                              AppTheme.dark.colorScheme.primary,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Entry.opacity(
                        delay: const Duration(milliseconds: 500),
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/png/dark.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 24.0,
                    left: 0.0,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: QuickLinks(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Section(
            title: "Rejuvenate",
            description:
                "Building the Ecosystem which brings new life to DeFi. For more security, safety and transparency!",
            asset: LineIcons.enviraGallery,
            buttonText: "Litepaper",
            onPressed: () {
              launchUrlString("https://docs.rejuvenate.finance");
            },
          ),
          Section(
            title: "Services",
            description:
                "We offer a variety of open source, secured and trustworthy DeFi protocols in order to generate yield for our users. The fees collected by our services build the foundation for an Crypto Emergency Fund & DeFi Insurance Program.",
            asset: LineIcons.userShield,
            buttonText: "Learn More",
            onPressed: () {
              launchUrlString("https://docs.rejuvenate.finance");
            },
            flipped: true,
          ),
          const Footer(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          "APP",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.open_in_new,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () =>
            AppRouter.key.currentState?.pushNamed(AppRoutes.dashboard),
      ),
    );
  }
}
