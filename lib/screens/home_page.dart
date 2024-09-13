import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  PageController _pageController = PageController(initialPage: 0);
  List<String> images = [
    "images/carousel1.png",
    "images/carousel2.png",
    "images/carousel3.png",
    // "images/carousel4.png",
    "images/carousel5.png",
  ];

  void autoSlide() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      _pageController.nextPage(
          duration: Duration(seconds: 1), curve: Curves.linear);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autoSlide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Infinte Scroll Carousel Slider"),
        // ),
        body: Container(
      width: double.maxFinite,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 700,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
            width: double.maxFinite,
            child: PageView.builder(
                controller: _pageController,
                itemCount: images.length * 1000,
                itemBuilder: (context, index) {
                  int imageIndex = index % images.length;
                  return Image.asset(
                    images[imageIndex],
                    fit: BoxFit.cover,
                  );
                }),
          )
        ],
      ),
    ));
  }
}
