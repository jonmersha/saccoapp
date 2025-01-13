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

  int? flippedIndex;

  void _toggleCard(int index) {
    setState(() {
      flippedIndex = flippedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 800;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Why Us?',
                style: TextStyle(
                  color: titleText,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isSmallScreen ? 2 : 4,
                  crossAxisSpacing: isSmallScreen?5:20,
                  mainAxisSpacing: isSmallScreen?10:20,
                  childAspectRatio: isSmallScreen?0.7:.9

                ),
                itemCount: reasons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _toggleCard(index),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, animation) {
                        return RotationYTransition(
                          rotation: animation,
                          child: child,
                        );
                      },
                      child: flippedIndex == index
                          ? _buildBackCard(reasons[index])
                          : _buildFrontCard(reasons[index]),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFrontCard(Map<String, String> reason) {
    return Container(
      key: ValueKey('front_${reason['title']}'),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            reason['title']!,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: titleText
            ),
          ),
          const SizedBox(height: 10),
          Text(
            reason['description']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard(Map<String, String> reason) {
    return Container(
      key: ValueKey('back_${reason['title']}'),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            reason['title']!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: titleText,
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
              backgroundColor:Colors.blueGrey.shade900,
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
                color: Colors.green
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RotationYTransition extends StatelessWidget {
  final Animation<double> rotation;
  final Widget child;

  const RotationYTransition({super.key, required this.rotation, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rotation,
      builder: (context, child) {
        final angle = rotation.value * 3.14;
        return Transform(
          transform: Matrix4.rotationY(angle),
          alignment: Alignment.center,
          child: rotation.value > 0.5
              ? Transform(
            transform: Matrix4.rotationY(3.14),
            alignment: Alignment.center,
            child: child,
          )
              : child,
        );
      },
      child: child,
    );
  }
}
