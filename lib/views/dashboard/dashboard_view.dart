import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/layout.dart';
import 'package:rejuvenate/controllers/dashboard_controller.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(DashboardController.instance);

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
