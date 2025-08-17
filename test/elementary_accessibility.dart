// elementary_accessibility.dart: elementary accessibility test
//
// please hire a blind person, a deaf person, a person with motor
// disorders, a paralyzed person, twelve people with sensory processing disorder
// nine people from different ends of the autistic spectrum, nine people with attention-deficit
// hyperactivity disorder, three people with dyslexia and one system with dissociative identity
// disorder and test with all of them for the best results and don't blindly rely on this set
// of automated tests under tests/accessibility.

import 'package:flutter_test/flutter_test.dart';
import 'package:lefty_framework_website/main.dart' show LamentApp;

void main() {
  testWidgets('Follows elementary accessibility guidelines', (tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(const LamentApp());

    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));
    handle.dispose();
  });
}