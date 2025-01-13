import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return isMobile
              ? Column(
            children: _buildFooterSections(),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildFooterSections(),
          );
        },
      ),
    );
  }

  List<Widget> _buildFooterSections() {
    return [
      const FooterSection(
        title: 'Address',
        content: 'Piasa, Addis Ababa, Ethiopia',
      ),
      const FooterSection(
        title: 'Contact',
        content: 'Phone: +251-123-456-789\nLandline: +251-11-123-4567\nEmail: info@example.com\nShort Number: 1234',
      ),
      FooterSection(
        title: 'Social Media',
        contentWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.facebook, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.youtube, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.telegram, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.xTwitter, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      const FooterSection(
        title: 'Products',
        content: 'Saving\nLoan\nApplications',
      ),
    ];
  }
}

class FooterSection extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? contentWidget;

  const FooterSection({super.key, required this.title, this.content, this.contentWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          content != null
              ? Text(
            content!,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          )
              : contentWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
