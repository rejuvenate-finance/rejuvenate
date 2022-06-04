import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/layout.dart';
import 'package:rejuvenate/controllers/otc_controller.dart';
import 'package:rejuvenate/views/otc/widgets/otc_buy_card.dart';
import 'package:rejuvenate/views/otc/widgets/otc_information_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OTCView extends HookConsumerWidget {
  const OTCView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(OTCController.instance);

    return AppLayout(
      title: controller.title,
      child: ScreenTypeLayout(
        mobile: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Flexible(child: OTCInformationCard()),
              Flexible(child: OTCBuyCard()),
            ],
          ),
        ),
        desktop: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Flexible(child: OTCInformationCard()),
              Flexible(child: OTCBuyCard()),
            ],
          ),
        ),
      ),
    );
  }
}
