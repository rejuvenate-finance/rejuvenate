import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/controllers/otc_controller.dart';
import 'package:rejuvenate/widgets/amount_text_field/amount_text_field.dart';

class StakeCard extends StatefulHookConsumerWidget {
  const StakeCard({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StakeCardState();
}

class _StakeCardState extends ConsumerState<StakeCard> {
  @override
  void initState() {
    ref.read(OTCController.instance).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(OTCController.instance);
    final textControllerBUSD = useTextEditingController(
      text: "0.9",
    );
    final textControllerRJV = useTextEditingController(
      text: "1.0",
    );

    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(200.0, 50.0),
    );

    final needsApproval =
        controller.allowance < controller.toWei(textControllerBUSD.text);

    return Card(
      elevation: 20.0,
      child: SizedBox(
        width: 500.0,
        height: 400.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AmountTextField(
                controller: textControllerRJV,
                hint: "100",
                label: "Stake RJV",
                icon: const Icon(Icons.shopping_bag_outlined),
                formatFunction: (oldValue, newValue) {
                  try {
                    if (newValue.text.isNotEmpty) {
                      final parsed = double.parse(newValue.text);
                      textControllerBUSD.value = TextEditingValue(
                        text: (parsed * 0.9).toString(),
                      );
                    } else {
                      textControllerBUSD.value = TextEditingValue.empty;
                    }
                    controller.refresh();
                    return newValue;
                  } catch (_) {
                    textControllerBUSD.value = TextEditingValue.empty;
                    return oldValue;
                  }
                },
              ),
              const SizedBox(
                height: 32.0,
              ),
              Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 24.0,
                  runSpacing: 24.0,
                  children: [
                    ElevatedButton(
                      style: buttonStyle,
                      onPressed: needsApproval
                          ? () => controller.approve(textControllerBUSD.text)
                          : null,
                      child: const Text(
                        "Approve RJV",
                      ),
                    ),
                    ElevatedButton(
                      style: buttonStyle,
                      onPressed: !needsApproval
                          ? () => controller.buy(textControllerBUSD.text)
                          : null,
                      child: const Text(
                        "Stake",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
