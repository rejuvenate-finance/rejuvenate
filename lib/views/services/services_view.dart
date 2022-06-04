import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rejuvenate/app/layout.dart';
import 'package:rejuvenate/app/routes.dart';
import 'package:rejuvenate/controllers/Services_controller.dart';
import 'package:rejuvenate/widgets/section/section.dart';
import 'package:rejuvenate/widgets/footer/footer.dart';

class ServicesView extends HookConsumerWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ServicesController.instance);
    final scrollController = useScrollController();

    return HomeLayout(
      child: ListView(
        controller: scrollController,
        cacheExtent: 0,
        addRepaintBoundaries: true,
        children: [
          Section(
            title: "Staking",
            description:
                "Stake your Rejuvenate Tokens to earn even more of them and make your voice heard in the community by participating in and creating proposals!",
            asset: LineIcons.layerGroup,
            buttonText: "Stake",
            onPressed: () {
              AppRouter.key.currentState?.pushNamed(AppRoutes.staking);
            },
          ),
          Section(
            title: "Yield Farming",
            description:
                "Farm your favorite assets all in one place - on our platform.",
            asset: LineIcons.chalkboard,
            buttonText: "Start Farming",
            onPressed: () {
              AppRouter.key.currentState?.pushNamed(AppRoutes.farms);
            },
            flipped: true,
          ),
          Section(
            title: "Rug Recovery",
            description:
                "The Insurance based on Pools. Get Coverage for almost all DeFi Projects even if they are not part of our ecosystem.",
            asset: LineIcons.handHoldingUsDollar,
            buttonText: "Become a Member",
            onPressed: () {
              AppRouter.key.currentState?.pushNamed(AppRoutes.rugRecovery);
            },
          ),
          const Footer(),
        ],
      ),
    );
  }
}
