import 'package:amarach/utils/network_access.dart';
import 'package:flutter/material.dart';

class ServiceListSection extends StatefulWidget {
  const ServiceListSection({super.key});

  @override
  State<ServiceListSection> createState() => _ServiceListSectionState();
}

class _ServiceListSectionState extends State<ServiceListSection> {
  late Future<List<dynamic>> serviceList;
  bool showAll = false;

  @override
  void initState() {
    super.initState();
    serviceList = fetchData('12');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 800;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 50),
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'የብድር አገልግሎቶች\nCredit Services',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign:
                        isSmallScreen ? TextAlign.center : TextAlign.left,
                  ),
                  _buildToggleButtons()
                ],
              ),
              const SizedBox(height: 20),
              // Use FutureBuilder to handle the network request
              FutureBuilder<List<dynamic>>(
                future: serviceList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                      'Failed to load services: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text(
                      'No services available.',
                      style: TextStyle(color: Colors.white),
                    );
                  } else {
                    return _buildServiceList(snapshot.data!, isSmallScreen);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Build the service list
  Widget _buildServiceList(List<dynamic> services, bool isSmallScreen) {
    List<Map<String, String>> data = services.map((item) {
      return {
        'name': item['service_name_am']?.toString() ?? '',
        'description': item['service_description_am']?.toString() ?? '',
        'image': item['image_path']?.toString() ?? '',
      };
    }).toList();

    List<Map<String, String>> displayedServices =
        showAll ? data : data.take(4).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        int crossAxisCount;
        //double aspectRatio;

        if (width < 600) {
          crossAxisCount = 2;
          //aspectRatio = 0.6;
        } else if (width < 900 && width > 600) {
          crossAxisCount = 3;
          //aspectRatio = 0.7;
        } else if (width < 1200) {
          crossAxisCount = 4;
          //aspectRatio = .7;
        } else {
          crossAxisCount = 5;
         // aspectRatio = .8;
        }

        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: displayedServices.map((service) {
            return Container(
              width: (width / crossAxisCount) - 10,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  service['image']!.isNotEmpty
                      ? Image.network(
                          service['image']!,
                          //width: 90,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.business,
                          size: 90,
                          color: Colors.white,
                        ),
                  const SizedBox(height: 10),
                  Text(
                    service['name']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    service['description']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
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

  // Toggle button to show all or limited services
  Widget _buildToggleButtons() {
    return TextButton(
      onPressed: () {
        // Handle toggle button press (you can manage _showAll state in the parent widget)
        setState(() {
          showAll = !showAll;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        !showAll
            ? 'ሁለንም/all'
            : 'የተወሰነ/some', // You can change this to show "Show All" or "Show Limited"
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
