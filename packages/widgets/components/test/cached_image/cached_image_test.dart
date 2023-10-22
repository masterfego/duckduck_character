import 'package:alchemist/alchemist.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => MaterialApp(home: Image.network(''));

void main() {
  mockNetworkImagesFor(
    () => goldenTest(
      'Cached Image',
      fileName: 'cache_image',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(maxWidth: 600),
        children: [
          GoldenTestScenario(
            name: 'load images',
            child: const CachedImage(
              url: '',
            ),
          ),
          GoldenTestScenario(
            name: 'show error Widget',
            child: CachedImage(
              url: null,
              height: 100,
              errorWidget: Container(color: Colors.red),
            ),
          ),
        ],
      ),
    ),
  );
}
