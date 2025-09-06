import 'package:flutter/material.dart';

class FlashingTextSpan extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;
  final Duration duration;

  const FlashingTextSpan({
    Key? key,
    required this.text,
    this.style,
    this.colors = const [Colors.red, Colors.blue, Colors.green],
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _FlashingTextSpanState createState() => _FlashingTextSpanState();
}

class _FlashingTextSpanState extends State<FlashingTextSpan>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();

    _colorAnimation = _controller.drive(
      TweenSequence<Color?>(
        List.generate(
          widget.colors.length,
          (index) => TweenSequenceItem(
            tween: ColorTween(
              begin: widget.colors[index],
              end: widget.colors[(index + 1) % widget.colors.length],
            ),
            weight: 1,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: widget.text,
                style:
                    widget.style?.copyWith(color: _colorAnimation.value) ??
                    TextStyle(color: _colorAnimation.value),
              ),
            ],
          ),
        );
      },
    );
  }
}
