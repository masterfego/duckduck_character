import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String imagePath;
  final String? imagePackage;
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback? onPressed;

  const EmptyPage({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Text(description),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonLabel),
        ),
      ],
    );
  }
}
