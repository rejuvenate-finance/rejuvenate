import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/widgets/amount_text_field/amount_text_field.dart';

class UnstakeCard extends StatefulHookConsumerWidget {
  const UnstakeCard({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UnstakeCardState();
}

class _UnstakeCardState extends ConsumerState<UnstakeCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textControllerBUSD = useTextEditingController(
      text: "0.9",
    );
    final textControllerRJV = useTextEditingController(
      text: "1.0",
    );

    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(200.0, 50.0),
    );

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
                label: "Unstake sRJV",
                icon: const Icon(Icons.arrow_upward),
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
                      onPressed: null,
                      child: const Text(
                        "Approve sRJV",
                      ),
                    ),
                    ElevatedButton(
                      style: buttonStyle,
                      onPressed: null,
                      child: const Text(
                        "Unstake",
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
