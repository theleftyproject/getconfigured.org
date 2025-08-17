import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FadeCard extends StatefulWidget {
  final String title;
  final String description;
  final Color color;

  const FadeCard({super.key, required this.title, required this.description, required this.color});

  @override
  // ignore: library_private_types_in_public_api
  _FadeCardState createState() => _FadeCardState();
}

class _FadeCardState extends State<FadeCard> {
  double _opacity = 0.0;

  void _handleVisibility(double visibleFraction) {
    setState(() {
      _opacity = visibleFraction > 0.1 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.title),
      onVisibilityChanged: (info) => _handleVisibility(info.visibleFraction),
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 12),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: widget.color.withAlpha(157),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 8),
              Text(widget.description,
                  style: TextStyle(fontSize: 16, color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}