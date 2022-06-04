import 'package:flutter/material.dart';
import 'package:rejuvenate/app/theme.dart';
import 'package:rejuvenate/widgets/quick_links/quick_links.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(onPrimary: AppTheme.textColor1),
            ),
            child: const QuickLinks(),
          ),
        ],
      ),
    );
  }
}
