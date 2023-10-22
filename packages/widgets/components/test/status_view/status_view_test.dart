import 'package:alchemist/alchemist.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('StatusView Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'status_view',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(
          maxWidth: 600,
          maxHeight: 600,
        ),
        children: [
          GoldenTestScenario(
            name: 'with all parameters',
            child: StatusView(
              imagePath: 'oops.png',
              title: 'The title',
              description:
                  'This is the description of the character. Interesting information can be found here.',
              buttonLabel: 'Click me',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  });
}
