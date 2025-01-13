import 'package:amarach/constants.dart';
import 'package:flutter/material.dart';

class ApplicationsForm extends StatefulWidget {
  const ApplicationsForm({super.key});

  @override
  _ApplicationsFormState createState() => _ApplicationsFormState();
}

class _ApplicationsFormState extends State<ApplicationsForm> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return isSmallScreen
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildApplicationCard(
                'Applications for MemberShip',
                'Apply for our exclusive member ship and get access to special discounts and offers.'
            ),
            const SizedBox(height: 20),
            _buildApplicationCard(
              'Applications for a Loan',
              'Apply for a loan and get financial support to achieve your goals.',
            ),

          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildApplicationCard(
                  'Applications for MemberShip',
                  'Apply for our exclusive member ship and get access to special discounts and offers.'
              ),
            ),
            //SizedBox(width: 10),
            Expanded(
              child: _buildApplicationCard(
                'Applications for a Loan',
                'Apply for a loan and get financial support to achieve your goals.',
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  // Helper method to build the application cards with benefits and a button
  Widget _buildApplicationCard(String title, String description) {
    return Container(
     // height: 300,
      // Set the height of the card to 500
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
         // Light blue background for the card
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Application for $title submitted!')),
                  );
                },
                style:

                ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                  backgroundColor: buttonBack,
                ),
                child: const Text('Apply Now',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

