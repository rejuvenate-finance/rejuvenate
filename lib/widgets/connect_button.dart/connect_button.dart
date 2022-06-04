import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/widgets/connect_button.dart/connect_button_controller.dart';

class ConnectButton extends ConsumerWidget {
  const ConnectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ConnectButtonController.instance);
    return ElevatedButton(
      onPressed: controller.onPressed,
      child: Text(
        controller.buttonText,
      ),
    );
  }
}
