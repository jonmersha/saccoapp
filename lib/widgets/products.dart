// // // import 'package:flutter/material.dart';
// // //
// // // class ServiceListSection extends StatefulWidget {
// // //   @override
// // //   _ServiceListSectionState createState() => _ServiceListSectionState();
// // // }
// // //
// // // class _ServiceListSectionState extends State<ServiceListSection> {
// // //   final List<Map<String, String>> services = [
// // //     {
// // //       'name': 'Savings Accounts',
// // //       'description': 'Secure your savings and earn interest with our flexible savings accounts.',
// // //     },
// // //     {
// // //       'name': 'Personal Loans',
// // //       'description': 'Get affordable personal loans with low interest rates to support your goals.',
// // //     },
// // //     {
// // //       'name': 'Business Loans',
// // //       'description': 'Access capital for your business to help you grow and succeed.',
// // //     },
// // //     {
// // //       'name': 'Community Investment',
// // //       'description': 'Invest in community projects and help build a better future for everyone.',
// // //     },
// // //     {
// // //       'name': 'Insurance Services',
// // //       'description': 'Protect your future with affordable insurance plans tailored to your needs.',
// // //     },
// // //     {
// // //       'name': 'Financial Education',
// // //       'description': 'Get financial literacy resources to help you make informed decisions.',
// // //     },
// // //   ];
// // //
// // //   bool _showAll = false;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return LayoutBuilder(
// // //       builder: (context, constraints) {
// // //         bool isSmallScreen = constraints.maxWidth < 800;
// // //
// // //         return Container(
// // //
// // //          // color: Colors.lightBlueAccent,
// // //           padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 50),
// // //           child: Column(
// // //             //crossAxisAlignment: isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.center,
// // //             crossAxisAlignment: CrossAxisAlignment.center,
// // //             children: [
// // //               SizedBox(height: 20),
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   Text(
// // //                     'Our Services',
// // //                     style: const TextStyle(
// // //                       color: Colors.black,
// // //                       fontSize: 28,
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                     textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
// // //                   ),
// // //                   _buildToggleButtons()
// // //                 ],
// // //               ),
// // //               SizedBox(height: 20),
// // //               _buildServiceList(isSmallScreen),
// // //             ],
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //
// // //   // Widget _buildServiceList(bool isSmallScreen) {
// // //   //   // Show only the first 4 services initially, then show all if _showAll is true
// // //   //   List<Map<String, String>> displayedServices = _showAll ? services : services.take(4).toList();
// // //   //
// // //   //   return LayoutBuilder(
// // //   //     builder: (context, constraints) {
// // //   //       int crossAxisCount = isSmallScreen ? 2 : 4; // Adjust the number of columns
// // //   //       double aspectRatio = isSmallScreen ? 0.8 : 1.2;
// // //   //
// // //   //       return ConstrainedBox(
// // //   //         constraints: BoxConstraints(
// // //   //           maxHeight: constraints.maxHeight, // Ensure it doesn't overflow vertically
// // //   //         ),
// // //   //         child: GridView.builder(
// // //   //           shrinkWrap: true,
// // //   //           physics: NeverScrollableScrollPhysics(),
// // //   //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //   //             crossAxisCount: crossAxisCount,
// // //   //             crossAxisSpacing: 10,
// // //   //             mainAxisSpacing: 10,
// // //   //             childAspectRatio: aspectRatio,
// // //   //           ),
// // //   //           itemCount: displayedServices.length,
// // //   //           itemBuilder: (context, index) {
// // //   //             return Card(
// // //   //               elevation: 5,
// // //   //               shape: RoundedRectangleBorder(
// // //   //                 borderRadius: BorderRadius.circular(10),
// // //   //               ),
// // //   //               color: _getRandomColor(index),
// // //   //               child: Padding(
// // //   //                 padding: const EdgeInsets.all(10.0),
// // //   //                 child: Column(
// // //   //                   mainAxisAlignment: MainAxisAlignment.center,
// // //   //                   children: [
// // //   //                     Icon(
// // //   //                       Icons.business,
// // //   //                       size: 40,
// // //   //                       color: Colors.white,
// // //   //                     ),
// // //   //                     SizedBox(height: 10),
// // //   //                     Text(
// // //   //                       displayedServices[index]['name']!,
// // //   //                       style: TextStyle(
// // //   //                         fontSize: 22,
// // //   //                         fontWeight: FontWeight.bold,
// // //   //                         color: Colors.white,
// // //   //                       ),
// // //   //                       textAlign: TextAlign.center,
// // //   //                     ),
// // //   //                     SizedBox(height: 10),
// // //   //                     Text(
// // //   //                       displayedServices[index]['description']!,
// // //   //                       style: TextStyle(
// // //   //                         fontSize: 16,
// // //   //                         color: Colors.white,
// // //   //                       ),
// // //   //                       textAlign: TextAlign.center,
// // //   //                     ),
// // //   //                   ],
// // //   //                 ),
// // //   //               ),
// // //   //             );
// // //   //           },
// // //   //         ),
// // //   //       );
// // //   //     },
// // //   //   );
// // //   // }
// // //   Widget _buildServiceList(bool isSmallScreen) {
// // //     List<Map<String, String>> displayedServices = _showAll ? services : services.take(4).toList();
// // //
// // //     return LayoutBuilder(
// // //       builder: (context, constraints) {
// // //         double width = constraints.maxWidth;
// // //
// // //         // Define breakpoints
// // //         int crossAxisCount;
// // //         double aspectRatio;
// // //
// // //         if (width < 800) {
// // //           // Small screen (mobile)
// // //           crossAxisCount = 2;
// // //           aspectRatio = 0.8;
// // //         } else if (width < 900 &&width>800) {
// // //           // Medium screen (tablet)
// // //           crossAxisCount = 3;
// // //           aspectRatio = 0.6;
// // //         } else if (width < 1200) {
// // //           // Large screen (small desktop)
// // //           crossAxisCount = 4;
// // //           aspectRatio = .7;
// // //         } else {
// // //           // Extra large screen (large desktop)
// // //           crossAxisCount = 5;
// // //           aspectRatio = .8;
// // //         }
// // //
// // //         return GridView.builder(
// // //           shrinkWrap: true,
// // //           physics: NeverScrollableScrollPhysics(),
// // //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //             crossAxisCount: crossAxisCount,
// // //             crossAxisSpacing: 10,
// // //             mainAxisSpacing: 10,
// // //             childAspectRatio: aspectRatio,
// // //           ),
// // //           itemCount: displayedServices.length,
// // //           itemBuilder: (context, index) {
// // //             return Card(
// // //               elevation: 2,
// // //               shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(0),
// // //               ),
// // //               color: _getRandomColor(index),
// // //               child: Padding(
// // //                 padding: const EdgeInsets.all(10.0),
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     Icon(
// // //                       Icons.business,
// // //                       size: 40,
// // //                       color: Colors.white,
// // //                     ),
// // //                     SizedBox(height: 10),
// // //                     Text(
// // //                       displayedServices[index]['name']!,
// // //                       style: TextStyle(
// // //                         fontSize: 22,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: Colors.white,
// // //                       ),
// // //                       textAlign: TextAlign.center,
// // //                     ),
// // //                     SizedBox(height: 10),
// // //                     Text(
// // //                       displayedServices[index]['description']!,
// // //                       style: TextStyle(
// // //                         fontSize: 16,
// // //                         color: Colors.white,
// // //                       ),
// // //                       textAlign: TextAlign.center,
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             );
// // //           },
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //
// // //   Widget _buildToggleButtons() {
// // //     return ElevatedButton(
// // //       onPressed: () {
// // //         setState(() {
// // //           _showAll = !_showAll;
// // //         });
// // //       },
// // //       style: ElevatedButton.styleFrom(
// // //         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
// // //         backgroundColor: Colors.blue,
// // //         shape: RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.circular(5),
// // //         ),
// // //       ),
// // //       child: Text(
// // //         _showAll ? 'Show Less' : 'Explore More',
// // //         style: TextStyle(
// // //           fontSize: 18,
// // //           color: Colors.white,
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Color _getRandomColor(int index) {
// // //     List<Color> colors = [
// // //       Colors.blue.shade800,
// // //       Colors.green.shade800,
// // //       Colors.purple.shade800,
// // //       Colors.orange.shade800,
// // //     ];
// // //     return colors[index % colors.length];
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// //
// // class ServiceListSection extends StatefulWidget {
// //   @override
// //   _ServiceListSectionState createState() => _ServiceListSectionState();
// // }
// //
// // class _ServiceListSectionState extends State<ServiceListSection> {
// //   final List<Map<String, String>> services = [
// //     {
// //       'name': 'Savings Accounts',
// //       'description': 'Secure your savings and earn interest with our flexible savings accounts.',
// //     },
// //     {
// //       'name': 'Personal Loans',
// //       'description': 'Get affordable personal loans with low interest rates to support your goals.',
// //     },
// //     {
// //       'name': 'Business Loans',
// //       'description': 'Access capital for your business to help you grow and succeed.',
// //     },
// //     {
// //       'name': 'Community Investment',
// //       'description': 'Invest in community projects and help build a better future for everyone.',
// //     },
// //     {
// //       'name': 'Insurance Services',
// //       'description': 'Protect your future with affordable insurance plans tailored to your needs.',
// //     },
// //     {
// //       'name': 'Financial Education',
// //       'description': 'Get financial literacy resources to help you make informed decisions.',
// //     },
// //   ];
// //
// //   bool _showAll = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return LayoutBuilder(
// //       builder: (context, constraints) {
// //         bool isSmallScreen = constraints.maxWidth < 800;
// //
// //         return Container(
// //           padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 50),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               SizedBox(height: 20),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text(
// //                     'Our Services',
// //                     style: const TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 28,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                     textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
// //                   ),
// //                   _buildToggleButtons()
// //                 ],
// //               ),
// //               SizedBox(height: 20),
// //               _buildServiceList(isSmallScreen),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   Widget _buildServiceList(bool isSmallScreen) {
// //     List<Map<String, String>> displayedServices = _showAll ? services : services.take(4).toList();
// //
// //     return LayoutBuilder(
// //       builder: (context, constraints) {
// //         double width = constraints.maxWidth;
// //
// //         // Define breakpoints
// //         int crossAxisCount;
// //         double aspectRatio;
// //
// //         if (width < 800) {
// //           // Small screen (mobile)
// //           crossAxisCount = 2;
// //           aspectRatio = 0.8;
// //         } else if (width < 900 && width > 800) {
// //           // Medium screen (tablet)
// //           crossAxisCount = 3;
// //           aspectRatio = 0.6;
// //         } else if (width < 1200) {
// //           // Large screen (small desktop)
// //           crossAxisCount = 4;
// //           aspectRatio = .7;
// //         } else {
// //           // Extra large screen (large desktop)
// //           crossAxisCount = 5;
// //           aspectRatio = .8;
// //         }
// //
// //         return GridView.builder(
// //           shrinkWrap: true,
// //           physics: NeverScrollableScrollPhysics(),
// //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //             crossAxisCount: crossAxisCount,
// //             crossAxisSpacing: 10,
// //             mainAxisSpacing: 10,
// //             childAspectRatio: aspectRatio,
// //           ),
// //           itemCount: displayedServices.length,
// //           itemBuilder: (context, index) {
// //             return Container(
// //               padding: const EdgeInsets.all(10.0),
// //               decoration: BoxDecoration(
// //                 color: _getRandomColor(index), // Apply background color
// //                 borderRadius: BorderRadius.circular(10), // Rounded corners
// //               ),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Icon(
// //                     Icons.business,
// //                     size: 40,
// //                     color: Colors.white,
// //                   ),
// //                   SizedBox(height: 10),
// //                   Text(
// //                     displayedServices[index]['name']!,
// //                     style: TextStyle(
// //                       fontSize: 22,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                     ),
// //                     textAlign: TextAlign.center,
// //                   ),
// //                   SizedBox(height: 10),
// //                   Text(
// //                     displayedServices[index]['description']!,
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       color: Colors.white,
// //                     ),
// //                     textAlign: TextAlign.center,
// //                   ),
// //                 ],
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
// //
// //   Widget _buildToggleButtons() {
// //     return ElevatedButton(
// //       onPressed: () {
// //         setState(() {
// //           _showAll = !_showAll;
// //         });
// //       },
// //       style: ElevatedButton.styleFrom(
// //         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
// //         backgroundColor: Colors.blue,
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(5),
// //         ),
// //       ),
// //       child: Text(
// //         _showAll ? 'Show Less' : 'Explore More',
// //         style: TextStyle(
// //           fontSize: 18,
// //           color: Colors.white,
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Color _getRandomColor(int index) {
// //     List<Color> colors = [
// //       Colors.blue.shade800,
// //       Colors.green.shade800,
// //       Colors.purple.shade800,
// //       Colors.orange.shade800,
// //     ];
// //     return colors[index % colors.length];
// //   }
// // }

// import 'package:amarach/constants.dart';
// import 'package:flutter/material.dart';

// class ServiceListSection extends StatefulWidget {
//   const ServiceListSection({super.key});

//   @override
//   _ServiceListSectionState createState() => _ServiceListSectionState();
// }

// class _ServiceListSectionState extends State<ServiceListSection> {
//   final List<Map<String, String>> services = [
//     {
//       'name': 'Savings Accounts',
//       'description': 'Secure your savings and earn interest with our flexible savings accounts.',
//     },
//     {
//       'name': 'Personal Loans',
//       'description': 'Get affordable personal loans with low interest rates to support your goals.',
//     },
//     {
//       'name': 'Business Loans',
//       'description': 'Access capital for your business to help you grow and succeed.',
//     },
//     {
//       'name': 'Community Investment',
//       'description': 'Invest in community projects and help build a better future for everyone.',
//     },
//     {
//       'name': 'Insurance Services',
//       'description': 'Protect your future with affordable insurance plans tailored to your needs.',
//     },
//     {
//       'name': 'Financial Education',
//       'description': 'Get financial literacy resources to help you make informed decisions.',
//     },
//   ];

//   bool _showAll = false;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         bool isSmallScreen = constraints.maxWidth < 800;

//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 50),
//           color: Colors.greenAccent, // Background color for the main container
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Our Services',
//                     style:  TextStyle(
//                       color: titleText,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
//                   ),
//                   _buildToggleButtons()
//                 ],
//               ),
//               const SizedBox(height: 20),
//               _buildServiceList(isSmallScreen),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildServiceList(bool isSmallScreen) {
//     List<Map<String, String>> displayedServices = _showAll ? services : services.take(4).toList();

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double width = constraints.maxWidth;

//         // Define breakpoints
//         int crossAxisCount;
//         double aspectRatio;

//         if (width < 600) {
//           // Small screen (mobile)
//           crossAxisCount = 2;
//           aspectRatio = 0.6;
//         } else if (width < 900 && width > 600) {
//           // Medium screen (tablet)
//           crossAxisCount = 3;
//           aspectRatio = 0.7;
//         } else if (width < 1200) {
//           // Large screen (small desktop)
//           crossAxisCount = 4;
//           aspectRatio = .7;
//         } else {
//           // Extra large screen (large desktop)
//           crossAxisCount = 5;
//           aspectRatio = .8;
//         }

//         return GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: crossAxisCount,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: aspectRatio,
//           ),
//           itemCount: displayedServices.length,
//           itemBuilder: (context, index) {
//             return Container(
//               padding: const EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10), // Rounded corners
//                 // No background color for individual services
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.business,
//                     size: 90,
//                     color: Colors.white, // Icon color
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     displayedServices[index]['name']!,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // Text color
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     displayedServices[index]['description']!,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.white, // Text color
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildToggleButtons() {
//     return TextButton(
//       onPressed: () {
//         setState(() {
//           _showAll = !_showAll;
//         });
//       },
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//        // backgroundColor: Colors.blue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//       child: Text(
//         _showAll ? 'Show Less' : 'Show More',
//         style: const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

import 'package:amarach/constants.dart';
import 'package:flutter/material.dart';

class ServiceListSection extends StatefulWidget {
  const ServiceListSection({super.key});

  @override
  _ServiceListSectionState createState() => _ServiceListSectionState();
}

class _ServiceListSectionState extends State<ServiceListSection> {
  final List<Map<String, String>> services = [
    {
      'name': 'Savings Accounts',
      'description':
          'Secure your savings and earn interest with our flexible savings accounts.',
    },
    {
      'name': 'Personal Loans',
      'description':
          'Get affordable personal loans with low interest rates to support your goals.',
    },
    {
      'name': 'Business Loans',
      'description':
          'Access capital for your business to help you grow and succeed.',
    },
    {
      'name': 'Community Investment',
      'description':
          'Invest in community projects and help build a better future for everyone.',
    },
    {
      'name': 'Insurance Services',
      'description':
          'Protect your future with affordable insurance plans tailored to your needs.',
    },
    {
      'name': 'Financial Education',
      'description':
          'Get financial literacy resources to help you make informed decisions.',
    },
  ];

  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 800;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 50),
          color: Colors.greenAccent, // Background color for the main container
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Our Services',
                    style: TextStyle(
                      color: titleText,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign:
                        isSmallScreen ? TextAlign.center : TextAlign.left,
                  ),
                  _buildToggleButtons()
                ],
              ),
              const SizedBox(height: 20),
              _buildServiceList(isSmallScreen),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceList(bool isSmallScreen) {
    List<Map<String, String>> displayedServices =
        _showAll ? services : services.take(4).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        // Define breakpoints
        int crossAxisCount;
        double aspectRatio;

        if (width < 600) {
          // Small screen (mobile)
          crossAxisCount = 2;
          aspectRatio = 0.6;
        } else if (width < 900 && width > 600) {
          // Medium screen (tablet)
          crossAxisCount = 3;
          aspectRatio = 0.7;
        } else if (width < 1200) {
          // Large screen (small desktop)
          crossAxisCount = 4;
          aspectRatio = .7;
        } else {
          // Extra large screen (large desktop)
          crossAxisCount = 5;
          aspectRatio = .8;
        }

        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: displayedServices.map((service) {
            return Container(
              width: (width / crossAxisCount) - 10,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Rounded corners
                // No background color for individual services
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.business,
                    size: 90,
                    color: Colors.white, // Icon color
                  ),
                  const SizedBox(height: 10),
                  Text(
                    service['name']!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    service['description']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Text color
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildToggleButtons() {
    return TextButton(
      onPressed: () {
        setState(() {
          _showAll = !_showAll;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        // backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        _showAll ? 'Show Less' : 'Show More',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
