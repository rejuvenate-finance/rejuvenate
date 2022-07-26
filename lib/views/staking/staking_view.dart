import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/layout.dart';
import 'package:rejuvenate/controllers/Staking_controller.dart';
import 'package:rejuvenate/views/staking/widgets/stake_card.dart';
import 'package:rejuvenate/views/staking/widgets/stake_information_card.dart';
import 'package:rejuvenate/views/staking/widgets/unstake_card.dart';
import 'package:rejuvenate/views/staking/widgets/unstake_information_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

class StakingView extends HookConsumerWidget {
  const StakingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(StakingController.instance);
    final pageController = usePageController(initialPage: 0, keepPage: true);
    final indexHook = useState(0);

    return AppLayout(
      title: controller.title,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ScreenTypeLayout(
              mobile: SizedBox(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    kBottomNavigationBarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Flexible(
                      child: StakeInformationCard(),
                    ),
                    Flexible(
                      child: StakeCard(),
                    ),
                  ],
                ),
              ),
              desktop: SizedBox(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    kBottomNavigationBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Flexible(child: StakeInformationCard()),
                    Flexible(child: StakeCard()),
                  ],
                ),
              ),
            ),
            ScreenTypeLayout(
              mobile: SizedBox(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    kBottomNavigationBarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Flexible(
                      child: UnstakeInformationCard(),
                    ),
                    Flexible(
                      child: UnstakeCard(),
                    ),
                  ],
                ),
              ),
              desktop: SizedBox(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    kBottomNavigationBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Flexible(child: UnstakeInformationCard()),
                    Flexible(child: UnstakeCard()),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_downward),
              label: "Stake",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_upward),
              label: "Unstake",
            ),
          ],
          currentIndex: indexHook.value,
          onTap: (index) {
            pageController.jumpToPage(index);
            indexHook.value = index;
          },
        ),
      ),
    );
  }
}
