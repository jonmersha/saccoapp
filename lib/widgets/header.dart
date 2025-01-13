import 'package:amarach/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(20),
      color: Colors.blue, // Background color of the header
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo and Organization Name aligned to the left
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 60,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://sacco.newtechplc.com/logo.png',),
                        fit: BoxFit.fitWidth
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                ],
              ),
              // Join Link aligned to the right
              isMobile
                  ? Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Join',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Contact Us!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.yellow),
                      ),
                      child: const Text(
                        'Join',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
