import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rejuvenate/app/layout.dart';
import 'package:rejuvenate/app/routes.dart';
import 'package:rejuvenate/widgets/footer/footer.dart';
import 'package:rejuvenate/widgets/section/section.dart';
import 'package:rejuvenate/widgets/team/team.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return HomeLayout(
      child: ListView(
        controller: scrollController,
        cacheExtent: 0,
        addRepaintBoundaries: true,
        children: [
          Section(
            title: "Rejuvenate",
            description:
                "Building the Ecosystem which brings new life to DeFi. For more security, safety and transparency!",
            asset: LineIcons.enviraGallery,
            buttonText: "Whitepaper",
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
              AppRouter.key.currentState?.pushNamed(AppRoutes.services);
            },
            flipped: true,
          ),
          Section(
            title: "The Team",
            description:
                "The team consistst of very skilled individuals from all backgrounds. It's important for us that every member does not only contirbute good work to the project, but also represents all our core values & vision.",
            asset: LineIcons.users,
            buttonText: "Who's on the Team?",
            onPressed: () {
              AppRouter.key.currentState?.pushNamed(AppRoutes.team);
            },
          ),
          const Footer(),
        ],
      ),
    );
  }
}
