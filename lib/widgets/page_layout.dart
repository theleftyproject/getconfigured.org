import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lefty_framework_website/util/scroll.dart';
import 'package:lefty_framework_website/widgets/footer.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        actions: <Widget>[
          Semantics(
            tooltip: 'https://doc.getconfigured.org',
            child: IconButton(
              onPressed: () async =>
                  await launchUrlString("https://doc.getconfigured.org"),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(isDarkMode ? Icons.library_books : Icons.library_books_outlined),
              ),
            ),
          ),

          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () async {
                await launchUrlString(
                  "https://github.com/theleftyproject/lament",
                );
              },
              child: Semantics(
                tooltip: 'https://github.com/theleftyproject/lament',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/github-mark-white.svg",
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(child: child),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Footer(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
