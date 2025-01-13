import 'package:amarach/constants.dart';
import 'package:flutter/material.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the screen width is small (e.g., less than 600 pixels)
          bool isSmallScreen = constraints.maxWidth < 800;
          return Container(
            color: sectionBack,
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 50),
            child: isSmallScreen
                ? Column(
                    children: [
                      _buildTextSection(isSmallScreen),
                      const SizedBox(height: 20),
                      //  _buildImageSection(isSmallScreen),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: _buildTextSection(isSmallScreen),
                      ),
                      // Expanded(
                      //   child: _buildImageSection(isSmallScreen),
                      // ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _buildTextSection(bool isSmallScreen) {
    return Column(
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'About Us',
          style: TextStyle(
            color: titleText,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 10),
        Text(
          "We Help our customers and Members Grow Their Business",
          style: TextStyle(
            color: titleText,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(
          height: 20,
        ),
        TabBar(
          labelColor: Colors.blueGrey,
          labelStyle: const TextStyle(fontSize: 20),
          unselectedLabelColor: Colors.blueGrey,
          indicatorColor: navBar,
          tabs: const [
            Tab(text: 'Story'),
            Tab(
              text: 'Vision',
            ),
            Tab(text: 'Mission'),
            Tab(text: 'Value'),
          ],
        ),
        SizedBox(
          height: 200,
          child: TabBarView(
            children: [
              // Vision Tab Content
              Text(
                "Our story began with a passion for innovation and a commitment to excellence. Over the years, we have grown into a trusted partner for businesses.",
                style: const TextStyle(fontSize: 20),
                textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
              ),
              // Mission Tab Content
              Text(
                "Our mission is to empower our customers with tools and support to achieve their goals.",
                style: const TextStyle(fontSize: 20),
                textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
              ),
              // Story Tab Content
              Text(
                "Our story began with a passion for innovation and a commitment to excellence. Over the years, we have grown into a trusted partner for businesses.",
                style: const TextStyle(fontSize: 20),
                textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
              ),
              Text(
                " Value Our story began with a passion for innovation and a commitment to excellence. Over the years, we have grown into a trusted partner for businesses.",
                style: const TextStyle(fontSize: 20),
                textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
              )
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildImageSection(bool isSmallScreen) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       image: DecorationImage(
  //         image: NetworkImage('https://sacco.newtechplc.com/img_3.png'),
  //         fit: BoxFit.fitWidth,
  //       ),
  //     ),
  //     height: isSmallScreen ? 200 : 400,
  //   );
  // }
}
