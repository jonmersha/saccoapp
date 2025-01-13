// import 'dart:math';
// import 'package:amarach/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class CustomerTestimonialsSection extends StatelessWidget {
//   final List<Map<String, String>> testimonials = [
//     {
//       'name': 'Abebe',
//       'image': 'https://www.example.com/john.jpg', // Replace with actual image URLs
//       'testimonial':
//       'The service was excellent, and I have seen significant improvements in my financial planning.',
//     },
//     {
//       'name': 'Muluneh',
//       'image': 'https://www.example.com/jane.jpg', // Replace with actual image URLs
//       'testimonial':
//       'A truly wonderful experience! The team was very professional and helped me achieve my financial goals.',
//     },
//     {
//       'name': 'Dereje',
//       'image': 'https://www.example.com/alex.jpg', // Replace with actual image URLs
//       'testimonial':
//       'I highly recommend their services. They made complex financial concepts easy to understand.',
//     },
//     {
//       'name': 'Sirak',
//       'image': 'https://www.example.com/emily.jpg', // Replace with actual image URLs
//       'testimonial':
//       'The support I received was beyond expectations. They truly care about their clients.',
//     },
//   ];
//
//   // List of predefined colors
//   final List<Color> cardColors = [
//     Colors.blue.shade400,
//     Colors.green.shade500,
//     Colors.yellow.shade900,
//     Colors.blueGrey.shade900
//   ];
//
//   // Function to get a random color from the predefined list
//   Color _getRandomColor() {
//     Random random = Random();
//     return cardColors[random.nextInt(cardColors.length)];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     // Calculate viewportFraction dynamically to fit fixed card width
//     const double cardWidth = 500; // Fixed card width increased to 500
//     double viewportFraction = cardWidth / screenWidth;
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//       color: Colors.blueGrey[50], // Light background color
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//            Text(
//             'What Our Customers Are Saying About Us',
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: titleText,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 20),
//           _buildTestimonialsSlider(context, viewportFraction),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTestimonialsSlider(BuildContext context, double viewportFraction) {
//     return CarouselSlider.builder(
//       options: CarouselOptions(
//         height: 600,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 6),
//         autoPlayAnimationDuration: Duration(milliseconds: 2000),
//         enlargeCenterPage: true,
//         viewportFraction: viewportFraction,
//         enlargeStrategy: CenterPageEnlargeStrategy.height, // Enlarge based on height
//         initialPage: 1, // Start from the second item to avoid overflow
//       ),
//       itemCount: testimonials.length,
//       itemBuilder: (context, index, realIndex) {
//         return _buildTestimonialCard(context, testimonials[index]);
//       },
//     );
//   }
//
//   Widget _buildTestimonialCard(BuildContext context, Map<String, String> testimonial) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10), // Add padding to prevent overflow
//         child: SizedBox(
//           width: 500, // Fixed card width increased to 500
//           child: Card(
//             color: _getRandomColor(), // Set random background color from the list
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             elevation: 0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 50, // Circular image
//                   backgroundImage: NetworkImage(testimonial['image']!),
//                 ),
//                 SizedBox(height: 15),
//                 Text(
//                   testimonial['name']!,
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   testimonial['testimonial']!,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:amarach/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomerTestimonialsSection extends StatelessWidget {
  final List<Map<String, String>> testimonials = [
    {
      'name': 'Abebe',
      'image': 'https://www.example.com/john.jpg', // Replace with actual image URLs
      'testimonial':
      'The service was excellent, and I have seen significant improvements in my financial planning.',
    },
    {
      'name': 'Muluneh',
      'image': 'https://sacco.newtechplc.com/img.png', // Replace with actual image URLs
      'testimonial':
      'A truly wonderful experience! The team was very professional and helped me achieve my financial goals.',
    },
    {
      'name': 'Dereje',
      'image': 'https://sacco.newtechplc.com/img.png', // Replace with actual image URLs
      'testimonial':
      'I highly recommend their services. They made complex financial concepts easy to understand.',
    },
    {
      'name': 'Sirak',
      'image': 'https://sacco.newtechplc.com/img.png', // Replace with actual image URLs
      'testimonial':
      'The support I received was beyond expectations. They truly care about their clients.',
    },{
      'name': 'Yohannes',
      'image': 'https://sacco.newtechplc.com/customer/1.png', // Replace with actual image URLs
      'testimonial':
      'The support I received was beyond expectations. They truly care about their clients.',
    },
  ];

  // List of predefined colors
   List<Color> cardColors = [
    Colors.blue.shade400,
    Colors.green.shade500,
    Colors.yellow.shade900,
    Colors.blueGrey.shade900
  ];

   CustomerTestimonialsSection({super.key});

  // Function to get a random color from the predefined list
  Color _getRandomColor() {
    Random random = Random();
    return cardColors[random.nextInt(cardColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate viewportFraction dynamically to fit fixed card width
    const double cardWidth = 500; // Fixed card width increased to 500
    double viewportFraction = cardWidth / screenWidth;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: Colors.blueGrey[50], // Light background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What Our Customers Are Saying About Us',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: titleText,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildTestimonialsSlider(context, viewportFraction),
        ],
      ),
    );
  }

  Widget _buildTestimonialsSlider(BuildContext context, double viewportFraction) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 600,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 2000),
        enlargeCenterPage: true,
        viewportFraction: viewportFraction,
        enlargeStrategy: CenterPageEnlargeStrategy.height, // Enlarge based on height
        initialPage: 1, // Start from the second item to avoid overflow
      ),
      itemCount: testimonials.length,
      itemBuilder: (context, index, realIndex) {
        return _buildTestimonialCard(context, testimonials[index]);
      },
    );
  }

  Widget _buildTestimonialCard(BuildContext context, Map<String, String> testimonial) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10), // Add padding to prevent overflow
        child: SizedBox(
          width: 500, // Fixed card width increased to 500
          child: Card(
            color: _getRandomColor(), // Set random background color from the list
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0,
            child: Column(
              children: [
                // Image at the top as a decorated container
                Expanded(
                  child: Container(
                    width: double.infinity,
                   // height: 350, // Adjust the height of the image container
                    decoration: BoxDecoration(
                      //color: Colors.yellow,
                      image: DecorationImage(
                        image: NetworkImage(testimonial['image']!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  testimonial['name']!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    testimonial['testimonial']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
