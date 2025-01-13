import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StatsListSection extends StatelessWidget {
  final List<Map<String, dynamic>> stats = [
    {
      'title': 'Happy Clients',
      'icon': Icons.sentiment_satisfied_alt,
      'count': '200',
    },
    {
      'title': 'Projects Completed',
      'icon': Icons.check_circle_outline,
      'count': '1234',
    },
    {
      'title': 'Dedicated Staff',
      'icon': Icons.group,
      'count': '400',
    },
    {
      'title': 'Awards Achieved',
      'icon': Icons.star,
      'count': '300',
    },
  ];

  StatsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 800;

        return Container(
          color: Colors.blue.shade100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 50),
          child: Column(
            crossAxisAlignment: isSmallScreen
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text(
                'Our Achievements and Milestones',
                style: TextStyle(
                  color: Colors.blueGrey.shade900,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
              ),
              const SizedBox(height: 20),
              isSmallScreen ? _buildVerticalList() : _buildHorizontalList(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHorizontalList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: stats.map((stat) {
        return _buildStatItem(stat);
      }).toList(),
    );
  }

  Widget _buildVerticalList() {
    return Column(
      children: stats.map((stat) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: _buildStatItem(stat),
        );
      }).toList(),
    );
  }

  Widget _buildStatItem(Map<String, dynamic> stat) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          stat['icon'],
          size: 50,
          color: Colors.blueGrey.shade700, // Icon color
        ),
        const SizedBox(height: 10),
        Text(
          stat['title'],
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        VisibilityCounter(endValue: int.parse(stat['count'])),
      ],
    );
  }
}

class VisibilityCounter extends StatefulWidget {
  final int endValue;

  const VisibilityCounter({super.key, required this.endValue});

  @override
  _VisibilityCounterState createState() => _VisibilityCounterState();
}

class _VisibilityCounterState extends State<VisibilityCounter> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.endValue.toString()),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0) {
          // Reset visibility and trigger rebuild to restart counting
          if (!_isVisible) {
            setState(() {
              _isVisible = true;
            });
          }
        } else {
          // Reset visibility state when the widget is no longer visible
          if (_isVisible) {
            setState(() {
              _isVisible = false;
            });
          }
        }
      },
      child: _isVisible
          ? FastCounter(endValue: widget.endValue)
          : const Text(
              '0',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
    );
  }
}

class FastCounter extends StatelessWidget {
  final int endValue;
  final Duration duration;

  const FastCounter({
    super.key,
    required this.endValue,
    this.duration = const Duration(seconds: 3),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: endValue),
      duration: duration,
      builder: (context, value, child) {
        return Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        );
      },
    );
  }
}
