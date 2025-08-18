import 'dart:ui' show Color;

extension ColorExt on Color {
  /// Gives the inverted colour for a color.
  Color get inverted => Color.fromARGB(
    (a * 255.0).round(),
    255 - (r * 255.0).round(),
    255 - (g * 255.0).round(),
    255 - (b * 255.0).round(),
  );

  /// Gets the red component of the color
  int get red => (r * 255).round() & 0xff;
  /// Gets the green component of the color
  int get green => (g * 255).round() & 0xff;
  /// Gets the blue component of the color
  int get blue => (b * 255).round() & 0xff;
  /// Gets the alpha component of the color
  int get alpha => (a * 255).round() & 0xff;

  /// Scales all components of a color by a factor
  Color scale(double factor, {bool includeAlpha = false}) =>
      withRed((red * factor).round())
          .withGreen((green * factor).round())
          .withBlue((blue * factor).round())
          .withAlpha(includeAlpha ? (alpha * factor).round() : alpha);
}
