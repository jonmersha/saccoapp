import 'package:amarach/constants.dart';
import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return isSmallScreen
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SizedBox(
                  width: constraints.maxWidth < 1000 ? constraints.maxWidth : 500,
                  child: Form(
                    key: _formKey,
                    child: _feedBackForm(context),
                  ),
                ),
              ),
            ),

          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: constraints.maxWidth < 1000 ? constraints.maxWidth : 600,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: _feedBackForm(context),
              ),
            ),

          ],
        );
      },
    );
  }

  Column _feedBackForm(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Feed Back',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Full Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your full name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text('Email Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your email address',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text('Phone Number (Optional)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your phone number (optional)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      const Text('Subject Line', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: _subjectController,
                        decoration: const InputDecoration(
                          hintText: 'Enter the subject of your feedback',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a subject line';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text('Message', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your feedback message',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your message';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Feedback submitted!')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                              backgroundColor: buttonBack,
                            ),
                            child: const Text('Submit Feedback',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,)
                    ],
                  );
  }

  // Helper method to build the application cards with benefits and a button
  // Widget _buildApplicationCard(String title, String description) {
  //   return Container(
  //     height: 500, // Set the height of the card to 500
  //     child: Card(
  //       elevation: 5,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       color: Colors.blue[100], // Light blue background for the card
  //       child: Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               title,
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(height: 10),
  //             Text(
  //               description,
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 color: Colors.grey[600],
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(height: 20),
  //
  //             ElevatedButton(
  //               onPressed: () {
  //                 // Action when the button is pressed
  //                 // You can navigate to another screen or show a dialog
  //                 ScaffoldMessenger.of(context).showSnackBar(
  //                   SnackBar(content: Text('Application for $title submitted!')),
  //                 );
  //               },
  //               child: Text('Apply Now'),
  //               style: ElevatedButton.styleFrom(
  //                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), backgroundColor: Colors.blue, // Button color
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
