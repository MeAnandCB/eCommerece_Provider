import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CourselSliderContainer extends StatelessWidget {
  const CourselSliderContainer({
    required this.FirstCourselSliderList,
  });

  final List FirstCourselSliderList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) => Container(
        decoration: BoxDecoration(
            //  color: Colors.amber,
            image: DecorationImage(
                image: AssetImage(
                  FirstCourselSliderList[index],
                ),
                fit: BoxFit.cover)),
      ),
      itemCount: FirstCourselSliderList.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 170,
        pageSnapping: true,
        autoPlay: true,
      ),
    );
  }
}

class secondCourselSliderContainer extends StatelessWidget {
  const secondCourselSliderContainer({
    required this.SecondCourselSliderList,
  });

  final List SecondCourselSliderList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) => Container(
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  SecondCourselSliderList[index],
                ),
                fit: BoxFit.cover)),
      ),
      itemCount: 2,
      options: CarouselOptions(
        height: 200,
        pageSnapping: true,
        autoPlay: true,
      ),
    );
  }
}
