import 'package:flutter/material.dart';
import 'package:moniepoint/screens/mt_splash_screen.dart';
import 'package:moniepoint/utils/globals.dart';

import 'utils/keys.dart';
import 'utils/themes.dart';
import 'utils/view_dimension.dart';

class MoniepointApp extends StatefulWidget {
  const MoniepointApp({super.key});

  @override
  State<MoniepointApp> createState() => _MoniepointAppState();
}

class _MoniepointAppState extends State<MoniepointApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    viewDimension = ViewDimension.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moniepoint',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppKeys.navigatorKey,
      theme: Themes.defaultTheme(),
      home: const SplashScreen(),
    );
  }
}
