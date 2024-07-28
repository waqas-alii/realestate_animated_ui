import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/globals.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen>
    with TickerProviderStateMixin {
  late final AnimationController _textAnimationController;
  late final Animation<double> _textAnimation;

  late final AnimationController _buyAnimationController;
  late final AnimationController _counterAnimationController;
  late final Animation<double> _buyAnimation;
  late final Animation<int> _buyCounterAnimation;

  late final AnimationController _rentAnimationController;
  late final Animation<double> _rentAnimation;
  late final Animation<int> _rentCounterAnimation;

  late final AnimationController _listAnimationController;
  late final Animation<Offset> _listAnimation;

  double _containerWidth = 20;
  double _imageSize = 20;
  double _sliderWidth = 45;

  FocusNode focusNode = FocusNode();
  final double _buyContainerSize = viewDimension.width(1) / 2 - 20;
  bool _showContent = false;
  bool _showSliderContent = false;

  @override
  void initState() {
    initAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _listAnimationController.dispose();
    _buyAnimationController.dispose();
    _counterAnimationController.dispose();
    _rentAnimationController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: viewDimension.height(1),
        width: viewDimension.width(1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              kPrimaryColor.withOpacity(0.5),
              kSecondaryColor.withOpacity(0.1)
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 45,
              child: Row(
                children: [
                  ClipRect(
                    child: AnimatedContainer(
                      width: _containerWidth,
                      height: 40,
                      curve: Curves.linear,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      duration: const Duration(seconds: 1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 14),
                        child: Visibility(
                          visible: _showContent,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                color: kSecondaryColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Saint Petersburg',
                                style: kTextStyle.copyWith(
                                    color: kSecondaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: AnimatedContainer(
                        width: _imageSize,
                        height: _imageSize,
                        curve: Curves.easeInOut,
                        duration: const Duration(seconds: 1),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/image.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AnimatedBuilder(
                                    animation: _textAnimation,
                                    builder: (context, child) {
                                      return ClipRect(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          heightFactor: _textAnimation.value,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Hi, Marina',
                                      style: kTextStyle.copyWith(
                                          fontSize: 22,
                                          color: kSecondaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  AnimatedBuilder(
                                    animation: _textAnimation,
                                    builder: (context, child) {
                                      return ClipRect(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          heightFactor: _textAnimation.value,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'lets select your\nperfect place',
                                      style: kTextStyle.copyWith(
                                          fontSize: 26,
                                          letterSpacing: 1,
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: ScaleTransition(
                                  scale: _buyAnimation,
                                  child: Container(
                                    width: _buyContainerSize,
                                    height: _buyContainerSize,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kPrimaryColor),
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "BUY",
                                          style: kTextStyle.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        AnimatedBuilder(
                                          animation: _buyCounterAnimation,
                                          builder: (context, child) {
                                            return Text(
                                              "${_buyCounterAnimation.value}",
                                              style: kTextStyle.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 45),
                                            );
                                          },
                                        ),
                                        Text(
                                          "Offers",
                                          style: kTextStyle.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ScaleTransition(
                                scale: _rentAnimation,
                                child: Container(
                                  width: _buyContainerSize,
                                  height: _buyContainerSize,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  padding: const EdgeInsets.all(25),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "RENT",
                                        style: kTextStyle.copyWith(
                                            color: kSecondaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      AnimatedBuilder(
                                        animation: _rentCounterAnimation,
                                        builder: (context, child) {
                                          return Text(
                                            "${_rentCounterAnimation.value}",
                                            style: kTextStyle.copyWith(
                                                color: kSecondaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45),
                                          );
                                        },
                                      ),
                                      Text(
                                        "Offers",
                                        style: kTextStyle.copyWith(
                                            color: kSecondaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    propertyImageContent()
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget propertyImageContent() {
    return SlideTransition(
      position: _listAnimation,
      child: Container(
          width: viewDimension.width(1),
          decoration: const BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: viewDimension.width(1),
                          height: 220,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/property1.png'),
                              // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: AnimatedContainer(
                          width: _sliderWidth,
                          duration: const Duration(seconds: 1),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          height: 45,
                          decoration: BoxDecoration(
                            color: kSliderColor.withOpacity(0.85),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Visibility(
                                visible: _showSliderContent,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Gladkova St.,25,',
                                    style: kTextStyle.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(13),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: kSecondaryColor,
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 400,
                      width: viewDimension.width(1) / 2,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/property2.png'),
                                  // Replace with your image path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: AnimatedContainer(
                              width: _sliderWidth,
                              duration: const Duration(seconds: 1),
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              height: 45,
                              decoration: BoxDecoration(
                                color: kSliderColor.withOpacity(0.85),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Visibility(
                                    visible: _showSliderContent,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Gubina St.,11,',
                                        style: kTextStyle.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    padding: const EdgeInsets.all(13),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: kSecondaryColor,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 195,
                          width: viewDimension.width(1) / 2 - 30,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/property3.png'),
                                      // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: AnimatedContainer(
                                  width: _sliderWidth,
                                  duration: const Duration(seconds: 1),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: kSliderColor.withOpacity(0.85),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Spacer(),
                                      Visibility(
                                        visible: _showSliderContent,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Coffee area',
                                            style: kTextStyle.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        margin: const EdgeInsets.all(2),
                                        padding: const EdgeInsets.all(13),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: kSecondaryColor,
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 195,
                          width: viewDimension.width(1) / 2 - 30,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/property4.png'),
                                      // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: AnimatedContainer(
                                  width: _sliderWidth,
                                  duration: const Duration(seconds: 1),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: kSliderColor.withOpacity(0.85),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Spacer(),
                                      Visibility(
                                        visible: _showSliderContent,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Bedside',
                                            overflow: TextOverflow.fade,
                                            style: kTextStyle.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        margin: const EdgeInsets.all(2),
                                        padding: const EdgeInsets.all(13),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: kSecondaryColor,
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          )),
    );
  }

  void initAnimations() {
    locationAndImageAnimation();
    textAnimation();
    rentAndBuyAnimation();
    listNavAnimation();
    sliderAnimation();
  }

  void locationAndImageAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showContent = true;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _containerWidth = 180;
        _imageSize = 45;
      });
    });
  }

  void rentAndBuyAnimation() {
    _buyAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _rentAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _counterAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _buyAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _buyAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _rentAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _rentAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _buyCounterAnimation = IntTween(
      begin: 1,
      end: 1034,
    ).animate(
      CurvedAnimation(
        parent: _counterAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _rentCounterAnimation = IntTween(
      begin: 1,
      end: 2212,
    ).animate(
      CurvedAnimation(
        parent: _counterAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      _textAnimationController.forward();
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      _buyAnimationController.forward();
      _rentAnimationController.forward();
      _counterAnimationController.forward();
    });
  }

  void listNavAnimation() {
    _listAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _listAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Starts off the bottom of the screen
      end: Offset.zero, // Ends at the container's final position
    ).animate(CurvedAnimation(
      parent: _listAnimationController,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(seconds: 2), () {
      _listAnimationController.forward();
    });
  }

  void textAnimation() {
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void sliderAnimation() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _sliderWidth = viewDimension.width(1) - 70;
      });
    });
    Future.delayed(const Duration(milliseconds: 3500), () {
      setState(() {
        _showSliderContent = true;
      });
    });
  }
}
