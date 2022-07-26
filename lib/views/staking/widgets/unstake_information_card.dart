import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rejuvenate/app/theme.dart';

class UnstakeInformationCard extends StatelessWidget {
  const UnstakeInformationCard({Key? key}) : super(key: key);

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
              "Unstake sRJV",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              wrapWords: false,
            ),
            AutoSizeText(
              "Unstake your \$sRJV tokens to receive \$RJV based on the time you participated in the staking program",
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
