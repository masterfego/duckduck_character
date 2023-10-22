import 'package:alchemist/alchemist.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CharacterTile Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'character_tile',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(maxWidth: 600),
        children: [
          GoldenTestScenario(
            name: 'with small title',
            child: const CharacterTile(title: 'Small title'),
          ),
          GoldenTestScenario(
            name: 'with large title',
            child: const CharacterTile(
                title:
                    'Very large title. THis tile is very large and is used for testing purpose.'),
          ),
        ],
      ),
    );
  });
}
