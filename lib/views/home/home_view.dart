import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rejuvenate/app/layout.dart';
import 'package:rejuvenate/app/routes.dart';
import 'package:rejuvenate/app/theme.dart';
import 'package:rejuvenate/widgets/footer/footer.dart';
import 'package:rejuvenate/widgets/home_text/home_text.dart';
import 'package:rejuvenate/widgets/navigation_bar/navigation_bar.dart';
import 'package:rejuvenate/widgets/quick_links/quick_links.dart';
import 'package:rejuvenate/widgets/section/section.dart';
import 'package:rejuvenate/widgets/team/team.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:math' as math;

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HomeLayout(
      child: Theme(
        data: AppTheme.dark,
        child: Stack(
          children: [
            Entry.offset(
              duration: const Duration(milliseconds: 350),
              xOffset: -MediaQuery.of(context).size.width * 0.4,
              child: Transform.translate(
                offset: Offset(-MediaQuery.of(context).size.width * 0.4, 0),
                child: Transform.rotate(
                  angle: (math.pi * 15) / 180,
                  child: OverflowBox(
                    maxHeight: 1500,
                    minHeight: 500,
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    child: Container(
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
              ),
            ),
            Entry.offset(
              duration: const Duration(milliseconds: 350),
              xOffset: MediaQuery.of(context).size.width * 0.4,
              child: Transform.translate(
                offset: Offset(MediaQuery.of(context).size.width * 0.4, 0),
                child: Transform.rotate(
                  angle: (math.pi * 15) / 180,
                  child: OverflowBox(
                    maxHeight: 1500,
                    minHeight: 500,
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    child: Container(
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
            if (MediaQuery.of(context).size.width >= 400)
              const Positioned(
                top: 60.0,
                left: 50,
                child: AnimatedOpacity(
                  opacity: 1,
                  duration: Duration(milliseconds: 500),
                  child: HomeText(
                    head: "Rejuvenate",
                    sub:
                        "Building the Ecosystem which brings new life to DeFi. For more security, safety and transparency!",
                  ),
                ),
              ),
            if (MediaQuery.of(context).size.width >= 400)
              Positioned(
                bottom: 50.0,
                right: 50,
                child: AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 500),
                  child: GestureDetector(
                    onTap: () => AppRouter.key.currentState
                        ?.pushNamed(AppRoutes.dashboard),
                    child: const HomeText(
                      head: "APP",
                      sub: "Access all of our tools and services in one place!",
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
    // child: ListView(
    //   controller: scrollController,
    //   cacheExtent: 0,
    //   addRepaintBoundaries: true,
    //   children: [
    //     Section(
    //       title: "Rejuvenate",
    //       description:
    //           "Building the Ecosystem which brings new life to DeFi. For more security, safety and transparency!",
    //       asset: LineIcons.enviraGallery,
    //       buttonText: "Whitepaper",
    //       onPressed: () {
    //         launchUrlString("https://docs.rejuvenate.finance");
    //       },
    //     ),
    //     Section(
    //       title: "Services",
    //       description:
    //           "We offer a variety of open source, secured and trustworthy DeFi protocols in order to generate yield for our users. The fees collected by our services build the foundation for an Crypto Emergency Fund & DeFi Insurance Program.",
    //       asset: LineIcons.userShield,
    //       buttonText: "Learn More",
    //       onPressed: () {
    //         AppRouter.key.currentState?.pushNamed(AppRoutes.services);
    //       },
    //       flipped: true,
    //     ),
    //     Section(
    //       title: "The Team",
    //       description:
    //           "The team consistst of very skilled individuals from all backgrounds. It's important for us that every member does not only contirbute good work to the project, but also represents all our core values & vision.",
    //       asset: LineIcons.users,
    //       buttonText: "Who's on the Team?",
    //       onPressed: () {
    //         AppRouter.key.currentState?.pushNamed(AppRoutes.team);
    //       },
    //     ),
    //     const Footer(),
    //   ],
    // ),
  }
}
