import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rejuvenate/app/theme.dart';

class OTCInformationCard extends StatelessWidget {
  const OTCInformationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 500.0,
        minHeight: MediaQuery.of(context).size.height / 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              "OTC",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              wrapWords: false,
            ),
            AutoSizeText(
              "If you are whitlesited \$RJV tokens can be bought for 0.9 \$BUSD per Token. The \$BUSD spent is partially distributed between the team and the treasury. You can only make a single purchase afterwards your whitelist-status expires. Whitelist spots can be requested by contacting the team.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textColor1,
                  ),
              wrapWords: false,
            ),
          ],
        ),
      ),
    );
  }
}
