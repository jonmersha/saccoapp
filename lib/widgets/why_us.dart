import 'package:amarach/constants.dart';
import 'package:flutter/material.dart';

class WhyUsSection extends StatefulWidget {
  const WhyUsSection({super.key});

  @override
  _WhyUsSectionState createState() => _WhyUsSectionState();
}

class _WhyUsSectionState extends State<WhyUsSection> {
  final List<Map<String, String>> reasons = [
    {
      'title': 'Trustworthy',
      'description':
          'We have built a reputation for reliability and trust over the years.',
      'details': 'Learn more about our history of reliability and trust.',
    },
    {
      'title': 'Affordable Rates',
      'description':
          'Our services are designed to be accessible and affordable for all.',
      'details': 'Find out how we keep our rates affordable.',
    },
    {
      'title': 'Community Focused',
      'description':
          'We prioritize the well-being and growth of our community members.',
      'details': 'Discover our community-focused initiatives.',
    },
    {
      'title': 'Innovative Solutions',
      'description':
          'We offer innovative financial solutions to help businesses thrive.',
      'details': 'Explore our cutting-edge financial solutions.',
    },
  ];

  int? expandedIndex;

  void _toggleCard(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;
        double width = constraints.maxWidth;

        // Define breakpoints
        int crossAxisCount = isSmallScreen ? 1 : 4;
        double aspectRatio = isSmallScreen ? 1 : 0.75;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Why Our Customers Choose Us?',
                style: TextStyle(
                  color: Colors.blueGrey.shade800,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Discover why our services stand out and why you should choose us.',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: reasons.map((reason) {
                  return Container(
                    width: isSmallScreen
                        ? width - 40
                        : (width / crossAxisCount) - 10,
                    child: GestureDetector(
                      onTap: () => _toggleCard(reasons.indexOf(reason)),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: expandedIndex == reasons.indexOf(reason)
                            ? _buildExpandedCard(reason)
                            : _buildCollapsedCard(reason),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCollapsedCard(Map<String, String> reason) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          reason['title']!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          reason['description']!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedCard(Map<String, String> reason) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          reason['title']!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          reason['details']!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Add action for "Explore More" button
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            backgroundColor: Colors.blueGrey.shade900,
            //foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const Text(
            'Explore More',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Additional content can go here. You can add more details about the reason or any other relevant information.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
