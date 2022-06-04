import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/controllers/farms_detail_controller.dart';

class FarmsDetailView extends ConsumerWidget {
  const FarmsDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(FarmsDetailController.instance);

    return Scaffold(
      body: Center(
        child: Text(
          controller.title,
        ),
      ),
    );
  }
}
