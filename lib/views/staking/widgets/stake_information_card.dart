import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rejuvenate/app/theme.dart';

class StakeInformationCard extends StatelessWidget {
  const StakeInformationCard({Key? key}) : super(key: key);

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
              "Stake RJV",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              wrapWords: false,
            ),
            AutoSizeText(
              "Stake \$RJV tokens for \$sRJV. You'll earn \$RJV rewards and will be able to participate in governance based on your share of the pool.",
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
