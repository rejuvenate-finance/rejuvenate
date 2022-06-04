import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rejuvenate/app/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Section extends HookWidget {
  const Section({
    Key? key,
    required this.title,
    required this.description,
    required this.asset,
    this.flipped = false,
    this.buttonText = "",
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String description;
  final IconData asset;
  final bool flipped;
  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _SectionPageImageSection(
                  asset: asset,
                ),
                Flexible(
                  child: _SectionPageTextSection(
                    title: title,
                    description: description,
                    onPressed: onPressed,
                    buttonText: buttonText,
                  ),
                ),
              ],
            ),
          ),
        ),
        desktop: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Row(
            children: [
              if (!flipped)
                Expanded(
                  flex: 3,
                  child: _SectionPageTextSection(
                    title: title,
                    description: description,
                    onPressed: onPressed,
                    buttonText: buttonText,
                  ),
                ),
              Expanded(
                flex: 2,
                child: _SectionPageImageSection(
                  asset: asset,
                ),
              ),
              if (flipped)
                Expanded(
                  flex: 3,
                  child: _SectionPageTextSection(
                    title: title,
                    description: description,
                    onPressed: onPressed,
                    buttonText: buttonText,
                  ),
                ),
            ],
          ),
        ));
  }
}

class _SectionPageImageSection extends StatelessWidget {
  const _SectionPageImageSection({Key? key, required this.asset})
      : super(key: key);

  final IconData asset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: max(MediaQuery.of(context).size.width / 3, 200),
        height: max(MediaQuery.of(context).size.width / 3, 200),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Entry.opacity(
            delay: const Duration(milliseconds: 200),
            duration: const Duration(milliseconds: 500),
            child: Icon(
              asset,
              size: max(MediaQuery.of(context).size.width / 3, 200),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionPageTextSection extends StatelessWidget {
  const _SectionPageTextSection({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String description;
  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Entry.scale(
            delay: const Duration(milliseconds: 200),
            child: AutoSizeText(
              title,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxFontSize: 60.0,
              wrapWords: false,
            ),
          ),
          Entry.opacity(
            delay: const Duration(milliseconds: 200),
            child: AutoSizeText(
              description,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: AppTheme.textColor1,
                  ),
              wrapWords: false,
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          if (onPressed != null)
            Entry.scale(
              delay: const Duration(milliseconds: 200),
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(buttonText),
              ),
            ),
        ],
      ),
    );
  }
}
