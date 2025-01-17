import 'package:flutter/material.dart';
import 'package:amarach/widgets/about_us.dart';
import 'package:amarach/widgets/activity_list.dart';
import 'package:amarach/widgets/applications.dart';
import 'package:amarach/widgets/customer_testmonial.dart';
import 'package:amarach/widgets/feed_back.dart';
import 'package:amarach/widgets/footer.dart';
import 'package:amarach/widgets/header.dart';
import 'package:amarach/widgets/products.dart';
import 'package:amarach/widgets/top_slide.dart';
import 'package:amarach/widgets/why_us.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            // Container(height: 50,),
            const Header(),
            const SizedBox(height: 480, child: SlidingPage()),
            const AboutUsSection(),
            StatsListSection(),
            const SizedBox(
              height: 30,
            ),
            // ProductList(),
            const WhyUsSection(),
            const SizedBox(
              height: 50,
            ),
            const ServiceListSection(),
            CustomerTestimonialsSection(),
            const SizedBox(
              height: 50,
            ),
            const ApplicationsForm(),
            const FeedbackForm(),
            const Footer()
          ]),
        ),
      ),
    );
  }
}
