import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint/utils/globals.dart';

import '../utils/constant.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late final AnimationController _filterIconAnimationController;
  late final Animation<double> _filterIconAnimation;

  late final AnimationController _searchAnimationController;
  late final Animation<double> _searchAnimation;

  late final AnimationController _pinsAnimationController;
  late final Animation<double> _pinsAnimation;

  bool _layersView = false;
  bool _showDropdownContent = false;
  double _dropdownSize = 0;
  double _pinSize = 0;

  @override
  void initState() {
    initAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _pinsAnimationController.dispose();
    _filterIconAnimationController.dispose();
    _searchAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: viewDimension.width(1),
            height: viewDimension.height(1),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/maps-normal.png'),
                fit: BoxFit.cover, // Makes the image cover the whole screen
              ),
            ),
            child: const Text(""),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 60, left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScaleTransition(
                scale: _searchAnimation,
                child: Container(
                  width: viewDimension.width(1) * 0.72,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    initialValue: "Saint Petersburg",
                    decoration: const InputDecoration(
                      hintText: 'Enter your text',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      // Remove the enabled border
                      focusedBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ScaleTransition(
                scale: _filterIconAnimation,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset(
                    'assets/icons/filter.png',
                    width: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 20, bottom: 90),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ScaleTransition(
                  scale: _searchAnimation,
                  child: GestureDetector(
                    onTap: () {
                      dropdownAnimation();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: iconBgColor),
                      child: Image.asset(
                        'assets/icons/layers.png',
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ScaleTransition(
                  scale: _searchAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: iconBgColor),
                    child: Image.asset(
                      'assets/icons/send.png',
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ScaleTransition(
            scale: _searchAnimation,
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(bottom: 100, right: 30),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: iconBgColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/list.png',
                    height: 12,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "List of variants",
                    style: kTextStyle.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        pinPointLocation(),
        Align(
          alignment: Alignment.bottomLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.only(left: 40, bottom: 150),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: _dropdownSize,
            height: _dropdownSize,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Visibility(
              visible: _showDropdownContent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showDropdownContent = false;
                        _dropdownSize = 0;
                        _layersView = false;
                        _pinSize = 70;
                      });
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/empty-wallet.png',
                          height: 20,
                          color: _layersView ? kSecondaryColor : kPrimaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Price     ",
                          style: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              color:
                                  _layersView ? kSecondaryColor : kPrimaryColor,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showDropdownContent = false;
                        _dropdownSize = 0;
                      });
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/trash.png',
                          height: 20,
                          color: kSecondaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Infrastructure",
                          style: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              color: kSecondaryColor,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showDropdownContent = false;
                        _dropdownSize = 0;
                        _layersView = true;
                        _pinSize = 40;
                      });
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/layers.png',
                          height: 20,
                          color: _layersView ? kPrimaryColor : kSecondaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Without layer",
                          style: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              color:
                                  _layersView ? kPrimaryColor : kSecondaryColor,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget pinPointLocation() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            width: _pinSize,
            height: 40,
            margin: const EdgeInsets.only(left: 30),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(0), // Not rounded
              ),
            ),
            child: _layersView
                ? Image.asset(
                    'assets/icons/building.png',
                    color: Colors.white,
                  )
                : Text(
                    '11 mn P',
                    style: kTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            width: _pinSize,
            height: 40,
            margin: const EdgeInsets.only(left: 80, top: 180),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(0), // Not rounded
              ),
            ),
            child: _layersView
                ? Image.asset(
                    'assets/icons/building.png',
                    color: Colors.white,
                  )
                : Text(
                    '95 mn P',
                    style: kTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            width: _pinSize,
            height: 40,
            margin: const EdgeInsets.only(left: 100, top: 230),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(0), // Not rounded
              ),
            ),
            child: _layersView
                ? Image.asset(
                    'assets/icons/building.png',
                    color: Colors.white,
                  )
                : Text(
                    '234 mn P',
                    style: kTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            width: _pinSize,
            height: 40,
            margin: const EdgeInsets.only(top: 340, right: 60),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(0), // Not rounded
              ),
            ),
            child: _layersView
                ? Image.asset(
                    'assets/icons/building.png',
                    color: Colors.white,
                  )
                : Text(
                    '695 mn P',
                    style: kTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            width: _pinSize,
            height: 40,
            margin: const EdgeInsets.only(left: 180, top: 220),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(0), // Not rounded
              ),
            ),
            child: _layersView
                ? Image.asset(
                    'assets/icons/building.png',
                    color: Colors.white,
                  )
                : Text(
                    '78 mn P',
                    style: kTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: _pinSize,
            height: 40,
            margin: const EdgeInsets.only(left: 280, top: 30),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(0), // Not rounded
              ),
            ),
            child: _layersView
                ? Image.asset(
                    'assets/icons/building.png',
                    color: Colors.white,
                  )
                : Text(
                    '5 mn P',
                    style: kTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: _pinSize,
            height: 40,
            margin: const EdgeInsets.only(left: 250, bottom: 170),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(0), // Not rounded
              ),
            ),
            child: _layersView
                ? Image.asset(
                    'assets/icons/building.png',
                    color: Colors.white,
                  )
                : Text(
                    '5 mn P',
                    style: kTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ],
    );
  }

  void initAnimations() {
    searchBarAnimation();
    pinPointAnimation();
  }

  void searchBarAnimation() {
    _filterIconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _searchAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _filterIconAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _filterIconAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _searchAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _searchAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      _searchAnimationController.forward();
      _filterIconAnimationController.forward();
    });
  }

  void pinPointAnimation() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _pinSize = 70;
      });
    });
  }

  void dropdownAnimation() {
    setState(() {
      _dropdownSize = 170;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showDropdownContent = true;
      });
    });
  }
}
