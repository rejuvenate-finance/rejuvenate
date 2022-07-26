import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/routes.dart';
import 'package:rejuvenate/app/theme.dart';

class RejuvenateApp extends StatefulHookConsumerWidget {
  const RejuvenateApp({Key? key}) : super(key: key);

  final String title = "Rejuvenate";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RejuvenateAppState();
}

class _RejuvenateAppState extends ConsumerState<RejuvenateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          AppTheme.light.textTheme,
        ),
      ),
      title: widget.title,
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.key,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.home,
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
    );
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
