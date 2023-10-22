import 'package:flutter/material.dart';

class StatusView extends StatelessWidget {
  final String imagePath;
  final String? imagePackage;
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback? onPressed;

  const StatusView({
    super.key,
    required this.imagePath,
    this.imagePackage,
    required this.title,
    required this.description,
    required this.buttonLabel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: Image.asset(
                    imagePath,
                    package: imagePackage,
                    excludeFromSemantics: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(title),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonLabel),
            ),
          ],
        ),
      ),
    );
  }
}
