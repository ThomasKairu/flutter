import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static Widget builder(BuildContext context) {
    return const OnboardingPage();
  }

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/img_884becc3_8a91_4.png',
    'assets/images/img_image_120.png',
    'assets/images/img_image_119.png',
    'assets/images/img_image_114.png',
    // images
  ];

  final List<String> _titles = [
    'Angel',
    'Navigate Pregnancy',
    'Community',
    'Tracking',
    // titles
  ];

  final List<String> _subtitles = [
    'Fetus',
    'With Loved Ones',
    'Support',
    'Tools',
    // subtitles
  ];

  final List<String> _descriptions = [
    'Welcome to Angel Fetus App',
    'Invite your partner and close ones. \nSuper easy sync!',
    'Celebrate your highs, offer \nsupport, and share incredible \nexperience of bringing new lives.',
    'Monitor your progress seamlessly \nwith us!'
    // descriptions
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4F4),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, right: 20.0),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registry');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('Skip'),
              ),
            ),
          ),
          Expanded(
            child: CarouselSlider.builder(
                itemCount: _images.length,
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  
                  enlargeCenterPage:
                      true, 
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    _images[index],
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  );
                }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _titles[_currentIndex],
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                _subtitles[_currentIndex],
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(0xFFF4716A),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  _descriptions[_currentIndex],
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0,
                    color: Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_images.length, (index) {
              return Container(
                width: 7.0,
                height: 8.0,
                margin: const EdgeInsetsDirectional.only(end: 8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? const Color(0xFFF4716A)
                      : const Color(0xFFD9D9D9),
                ),
              );
            }),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
