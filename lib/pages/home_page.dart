import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String headline =
      "NixOS, Ansible, and a number of other programs provide various ways "
      "to configure a system declaratively. However, these programs either break "
      "or override when a config file under their responsibility is edited manually. "
      "This causes a lot of issues while troubleshooting because tutorials, forum posts, "
      "manual pages, GitHub issues, and even AI-generated answers involve direct editing "
      "of config files.";

  final String tagline = "Nix was a PhD thesis, we bring you the antithesis";

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Trans pride gradient
    final backgroundGradient = LinearGradient(
      colors: isDarkMode
          ? [
              Color(0xFF2E8BC0), // darker blue
              Color(0xFFC77DA1), // darker pink
              Color(0xFFAAAAAA), // greyish white
              Color(0xFFC77DA1),
              Color(0xFF2E8BC0),
            ]
          : [
              Color(0xFF5BCEFA), // light blue
              Color(0xFFF5A9B8), // pink
              Color(0xFFFFFFFF), // white
              Color(0xFFF5A9B8), // pink
              Color(0xFF5BCEFA), // light blue
            ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "The Lefty Application, Modification, Editing and Notification Tool",
        ),
        leading: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Image.asset("assets/images/lament.png"),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await launchUrlString(
                "https://github.com/theleftyproject/lament",
              );
            },
            icon: const Icon(Icons.code),
            style: ButtonStyle(
              backgroundColor: WidgetStateColor.resolveWith(
                ((_) => Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 48.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    "LAMENT",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? Colors.deepPurple[300]
                          : Colors.deepPurple[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Headline
                  Text(
                    headline,
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.6,
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Tagline with emphasis
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
                  const SizedBox(height: 48),

                  // Get Started Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode
                          ? Colors.deepPurple[300]
                          : Colors.deepPurple[600],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      await launchUrlString(
                        "https://github.com/theleftyproject/lament",
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
