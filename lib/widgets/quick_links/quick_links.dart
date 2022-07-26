import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rejuvenate/app/theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton.icon(
            onPressed: () {
              launchUrlString("https://docs.rejuvenate.finance");
            },
            icon: Icon(
              LineIcons.alternateExternalLink,
              color: AppTheme.dark.colorScheme.onPrimary,
            ),
            label: Text(
              "Documentation",
              style: TextStyle(
                color: AppTheme.dark.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        Divider(color: AppTheme.dark.colorScheme.onPrimary),
        Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              _QuickLinksItem(
                icon: LineIcons.telegram,
                url: 'https://t.me/+LxJTReW_wDRmMmYx',
              ),
              _QuickLinksItem(
                icon: LineIcons.twitter,
                url: 'https://twitter.com/rejuvenateRJV',
              ),
              _QuickLinksItem(
                icon: LineIcons.discord,
                url: 'https://discord.gg/9Ey8T9M5',
              ),
              _QuickLinksItem(
                icon: LineIcons.medium,
                url: 'https://medium.com/@rejuvenate.finance',
              ),
              _QuickLinksItem(
                icon: LineIcons.github,
                url: 'https://github.com/rejuvenate-finance',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickLinksItem extends StatelessWidget {
  const _QuickLinksItem({
    Key? key,
    required this.icon,
    required this.url,
  }) : super(key: key);

  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => launchUrlString(url),
      iconSize: 32.0,
      icon: Icon(
        icon,
        color: AppTheme.dark.colorScheme.onPrimary,
      ),
      hoverColor: Colors.transparent,
    );
  }
}
