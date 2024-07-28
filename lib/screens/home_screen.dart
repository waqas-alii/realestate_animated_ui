import 'package:flutter/material.dart';
import 'package:moniepoint/screens/map_screen.dart';
import 'package:moniepoint/screens/property_screen.dart';
import 'package:moniepoint/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _bottomNavAnimationController;
  late final Animation<Offset> _bottomNavAnimation;
  bool _showHomeScreen = true;

  @override
  void initState() {
    bottomNavAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _bottomNavAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _showHomeScreen ? const PropertyScreen() : const MapScreen(),
            SlideTransition(
              position: _bottomNavAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:
                      const EdgeInsets.only(bottom: 20, left: 50, right: 50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: lightBlack,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _showHomeScreen
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showHomeScreen = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: darkBlack),
                                child: Image.asset(
                                  'assets/icons/search.png',
                                  height: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: kPrimaryColor),
                              child: Image.asset(
                                'assets/icons/search.png',
                                height: 20,
                                color: Colors.white,
                              ),
                            ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: darkBlack),
                        child: Image.asset(
                          'assets/icons/message.png',
                          height: 20,
                          color: Colors.white,
                        ),
                      ),
                      _showHomeScreen
                          ? Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: kPrimaryColor),
                              child: Image.asset(
                                'assets/icons/home.png',
                                height: 20,
                                color: Colors.white,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showHomeScreen = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: darkBlack),
                                child: Image.asset(
                                  'assets/icons/home.png',
                                  height: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: darkBlack),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: darkBlack),
                        child: Image.asset(
                          'assets/icons/person.png',
                          height: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void onButtonTap() {
    setState(() {
      _showHomeScreen = !_showHomeScreen;
    });
  }

  void bottomNavAnimation() {
    _bottomNavAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _bottomNavAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Starts off the bottom of the screen
      end: Offset.zero, // Ends at the container's final position
    ).animate(CurvedAnimation(
      parent: _bottomNavAnimationController,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(seconds: 2), () {
      _bottomNavAnimationController.forward();
    });
  }
}
