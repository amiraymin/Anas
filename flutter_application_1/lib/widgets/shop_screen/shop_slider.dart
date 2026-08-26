import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopSlider extends StatefulWidget {
  const ShopSlider({super.key});

  @override
  State<ShopSlider> createState() => _ShopSliderState();
}

class _ShopSliderState extends State<ShopSlider> {
  int activeSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (i, r) {
              setState(() {
                activeSlider = i;
              }
              );
            },
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlay: true,
            height: 200,
            viewportFraction: 1,
          ),
          items: sliderImages
              .map(
                (i) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.asset(i).image,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Positioned(
          bottom: 20,
          child: Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: AnimatedSmoothIndicator(
              activeIndex: activeSlider,
              count: sliderImages.length,
              effect: ExpandingDotsEffect(
                dotColor: Color.fromARGB(255, 58, 58, 58),
                activeDotColor: Color(0xff53B175),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<String> sliderImages = [
  'assets/imges/slider 1.png',
  'assets/imges/slider 2.png',
  'assets/imges/slider 3.png',
];
