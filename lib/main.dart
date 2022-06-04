import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/app.dart';
import 'package:rejuvenate/app/injector.dart';

void main() {
  setupInjector();
  runApp(
    const ProviderScope(
      child: RejuvenateApp(),
    ),
  );
}
