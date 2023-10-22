import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isSelected;

  const CharacterTile({
    super.key,
    required this.title,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: title,
      button: true,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: isSelected ? Colors.red[900] : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
