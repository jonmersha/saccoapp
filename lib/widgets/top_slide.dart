import 'package:amarach/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlidingPage extends StatefulWidget {
  const SlidingPage({super.key});

  @override
  _SlidingPageState createState() => _SlidingPageState();
}

class _SlidingPageState extends State<SlidingPage> {
  int _currentIndex = 0;

  final List<Map<String, String>> _slides = [
    {
      'image': 'https://sacco.newtechplc.com/img.png',
      'title': 'Welcome to Amarach',
      'description':
          'Empowering communities through financial inclusion and support.',
    },
    {
      'image': 'https://sacco.newtechplc.com/img_1.png',
      'title': 'Savings Made Easy',
      'description':
          'Save securely and achieve your financial goals with our tailored solutions.',
    },
    {
      'image': 'https://sacco.newtechplc.com/adv.jpeg',
      'title': 'Affordable Credit',
      'description':
          'Access affordable loans to grow your business and improve your livelihood.',
    },
    {
      'image': 'https://sacco.newtechplc.com/img_3.png',
      'title': 'Community Growth',
      'description':
          'Join a network of members dedicated to mutual growth and success.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return Stack(
          children: [
            CarouselSlider(
              items: _slides.map((slide) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      slide['image']!,
                      fit: BoxFit.cover,
                    ),
                    Container(
                        decoration: BoxDecoration(
                      color: navBar,
                      image:
                          DecorationImage(image: NetworkImage(slide['image']!),fit: BoxFit.cover),
                    )
                        //color: navBar,
                        ),
                    isSmallScreen
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: _buildTextContent(slide, isSmallScreen),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                flex: 1, // Text occupies 50% of the width
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child:
                                      _buildTextContent(slide, isSmallScreen),
                                ),
                              ),
                              const Spacer(), // Ensures the text occupies only 50% width
                            ],
                          ),
                  ],
                );
              }).toList(),
              options: CarouselOptions(
                height: double.infinity,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_slides.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _currentIndex == index ? 16 : 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextContent(Map<String, String> slide, bool isSmallScreen) {
    return Column(
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          slide['title']!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 10),
        Text(
          slide['description']!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }
}
