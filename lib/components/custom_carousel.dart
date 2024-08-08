import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Mycarousel extends StatefulWidget {
  const Mycarousel({super.key});

  @override
  State<Mycarousel> createState() => _MycarouselState();
}

class _MycarouselState extends State<Mycarousel> {
  List imageList = [
    {"id": 1, "image_path": 'images/9.jpeg'},
    {"id": 2, "image_path": 'images/10.jpg'},
    {"id": 3, "image_path": 'images/uoc_1.png'},
    {"id": 4, "image_path": 'images/uos_2.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList
          .map(
            (item) => Container(
              margin: EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item['image_path'],
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ),
          )
          .toList(),
      carouselController: carouselController,
      options: CarouselOptions(
        height: 160,
        scrollPhysics: BouncingScrollPhysics(),
        autoPlay: true,
        aspectRatio: 2,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
