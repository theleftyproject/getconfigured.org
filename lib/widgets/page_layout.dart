import 'package:flutter/material.dart';
import 'package:lefty_framework_website/util/scroll.dart';
import 'footer.dart';

class PageLayout extends StatelessWidget {
  final Widget child; // Page-specific content
  final ScrollController? scrollController;
  final String title;
  const PageLayout({
    super.key,
    required this.title,
    required this.child,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final backgroundGradient = LinearGradient(
      colors: isDarkMode
          ? [
              Color(0xFF2E8BC0),
              Color(0xFFC77DA1),
              Color(0xFFAAAAAA),
              Color(0xFFC77DA1),
              Color(0xFF2E8BC0),
            ]
          : [
              Color(0xFF5BCEFA),
              Color(0xFFF5A9B8),
              Color(0xFFFFFFFF),
              Color(0xFFF5A9B8),
              Color(0xFF5BCEFA),
            ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(179),
        title: Text(title),
        leading: InkWell(
          onTap: () async {
            if (scrollController != null) {
              await scrollToTop(scrollController!);
            }
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Semantics(
              label: 'LAMENT Logo',
              child: Image.asset("assets/images/lament.png"),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              child, // Page-specific content goes here
              const SizedBox(height: 128), // Space above footer
              // Full-width footer
              LayoutBuilder(
                builder: (context, constraints) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(
                        context,
                      ).size.width, // full screen width
                      child: Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Footer(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
