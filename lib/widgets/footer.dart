import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        color: Colors.deepPurple,
        height: 61.7,
        width: double.infinity,
        child: Center(
          child: Semantics(
            label: 'Copyright \u00A9 2024 - ${DateTime.now().year} Gayest Systems. '
                    'Licensed under GNU General Public License Version 3. '
                    'Source code for this website can be found at ',
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'Copyright \u00A9 2024 - ${DateTime.now().year} Gayest Systems. Licensed under GNU General Public License Version 3.',
                  ),
                  const TextSpan(
                    text: " Source code for this website can be found at ",
                  ),
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.lightBlueAccent,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async => await launchUrlString("https://github.com/theleftyproject/getconfigured.org"),
                    text: "https://github.com/theleftyproject/getconfigured.org"
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
