import 'package:flutter/material.dart';

class FlashingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;
  final Duration duration;

  const FlashingText({
    Key? key,
    required this.text,
    this.style,
    this.colors = const [Colors.red, Colors.blue, Colors.green, Colors.yellow],
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _FlashingTextState createState() => _FlashingTextState();
}

class _FlashingTextState extends State<FlashingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);

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
        return Text(
          widget.text,
          style:
              widget.style?.copyWith(color: _colorAnimation.value) ??
              TextStyle(color: _colorAnimation.value),
        );
      },
    );
  }
}
