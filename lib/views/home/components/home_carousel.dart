import 'package:carousel_slider/carousel_slider.dart';
import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/size_config.dart';
import 'package:flutter/material.dart';

final List<String> imgCarousel = [
  "assets/images/home_hero1.png",
  "assets/images/home_hero2.png",
  "assets/images/home_hero3.png",
  "assets/images/home_hero4.png",
];

final List<Widget> imgSlider = imgCarousel
    .map((img) => Container(
          height: getProportionateScreenWidth(275),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(img), fit: BoxFit.fitWidth)),
        ))
    .toList();

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _currentImg = 0;

  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(250),
      decoration: const BoxDecoration(
        color: kPrimaryLightColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 300,
              height: 10,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 40,
                  color: Color.fromARGB(255, 56, 86, 184).withOpacity(0.5),
                )
              ]),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CarouselSlider(
                    items: imgSlider,
                    carouselController: _carouselController,
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImg = index;
                          });
                        },
                        enlargeCenterPage: false,
                        aspectRatio: 2,
                        autoPlay: true,
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                        autoPlayInterval: const Duration(seconds: 3),
                        viewportFraction: 1)),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(153, 11, 13, 30),
                          Color.fromARGB(0, 13, 13, 41)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 21,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgCarousel.asMap().entries.map((e) {
                      return GestureDetector(
                          onTap: () {
                            _carouselController.animateToPage(e.key);
                          },
                          child: Container(
                            width: getProportionateScreenWidth(84),
                            height: getProportionateScreenWidth(10),
                            alignment: Alignment.center,
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Container(
                              width: getProportionateScreenWidth(84),
                              height: getProportionateScreenWidth(2),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: _currentImg == e.key
                                    ? Colors.white
                                    : Colors.white30,
                              ),
                            ),
                          ));
                    }).toList(),
                  ),
                ),
                Positioned(
                    bottom: getProportionateScreenWidth(34),
                    left: getProportionateScreenWidth(18),
                    child: Text(
                      "Home New Arrivals",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.9)),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
