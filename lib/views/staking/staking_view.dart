import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/layout.dart';
import 'package:rejuvenate/controllers/Staking_controller.dart';

class StakingView extends ConsumerWidget {
  const StakingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(StakingController.instance);

    return AppLayout(
      title: controller.title,
      child: Center(
        child: Text(
          controller.title,
        ),
      ),
    );
  }
}
