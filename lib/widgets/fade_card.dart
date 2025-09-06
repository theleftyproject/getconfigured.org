import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:color_ext/color_ext.dart';

class FadeCard extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  final bool slideFromLeft;

  const FadeCard({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    this.slideFromLeft = true,
  });

  @override
  _FadeCardState createState() => _FadeCardState();
}

class _FadeCardState extends State<FadeCard> {
  double _opacity = 0.0;
  late Offset _offset;
  bool _firstRender = true;

  @override
  void initState() {
    super.initState();
    // slide-in only for the first render
    _offset = widget.slideFromLeft ? Offset(-0.3, 0) : Offset(0.3, 0);
  }

  void _handleVisibility(double visibleFraction) {
    if (_firstRender && visibleFraction > 0.1) {
      // first render: slide + fade
      setState(() {
        _opacity = 1.0;
        _offset = Offset.zero;
        _firstRender = false;
      });
    } else if (!_firstRender) {
      // subsequent renders: only fade
      setState(() {
        _opacity = visibleFraction > 0.1 ? 1.0 : 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.title),
      onVisibilityChanged: (info) => _handleVisibility(info.visibleFraction),
      child: AnimatedSlide(
        offset: _offset,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeOut,
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
                  color: widget.color.withLuminance(0.6),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
