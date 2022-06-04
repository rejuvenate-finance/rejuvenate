import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/layout.dart';
import 'package:rejuvenate/controllers/Team_controller.dart';
import 'package:rejuvenate/widgets/team/team.dart';
import 'package:rejuvenate/widgets/footer/footer.dart';

class TeamView extends HookConsumerWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(TeamController.instance);
    final scrollController = useScrollController();

    return HomeLayout(
      child: ListView(
        controller: scrollController,
        cacheExtent: 0,
        addRepaintBoundaries: true,
        children: const [
          Team(),
          Footer(),
        ],
      ),
    );
  }
}
