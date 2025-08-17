import 'package:flutter/material.dart';
import 'package:lefty_framework_website/widgets/page_layout.dart';
import 'package:lefty_framework_website/widgets/fade_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> cards = [
    {"title": "Declarative", "description": "Manage configs safely and declaratively."},
    {"title": "Safe", "description": "Manual edits never get overridden unintentionally."},
    {"title": "Flexible", "description": "Supports multiple tools and environments."},
    {"title": "Integrable", "description": "Works alongside your existing workflow."},
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return PageLayout(
      title: "The Lefty Framework",
      child: Column(
        children: [
          Text(
            "LAMENT",
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
           RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      children: [
                        const TextSpan(
                          text: "Nix was a PhD thesis, we bring you the ",
                        ),
                        TextSpan(
                          text: "antithesis",
                          style: TextStyle(
                            color: isDarkMode
                                ? Colors.deepPurple[300]
                                : Colors.deepPurple[700],
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
          const SizedBox(height: 32),
          Column(
            children: List.generate(cards.length, (index) {
              final isBlue = index % 2 == 0;
              final color = isBlue ? Color(0xff5bcefa) : Color(0xffc77da1);
              return FadeCard(
                title: cards[index]["title"]!,
                description: cards[index]["description"]!,
                color: color,
              );
            }),
          ),
        ],
      ),
    );
  }
}
