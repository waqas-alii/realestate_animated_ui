import 'package:flutter/material.dart';
import 'package:moniepoint/screens/home_screen.dart';

import '../../main.dart';
import '../../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isTab = true;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) => const HomeScreen()),
          (r) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    isTab = isTablet(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/icons/logo.jpg',
              height: isTab ? 160 : 100,
              width: isTab ? 160 : 100,
              fit: BoxFit.cover, // ensures the image fits within the circle
            ),
          ),
        ),
      ),
    );
  }
}
