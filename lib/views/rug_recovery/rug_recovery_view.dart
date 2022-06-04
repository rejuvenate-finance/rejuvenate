import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/layout.dart';
import 'package:rejuvenate/controllers/rug_recovery_controller.dart';

class RugRecoveryView extends ConsumerWidget {
  const RugRecoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(RugRecoveryController.instance);

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
