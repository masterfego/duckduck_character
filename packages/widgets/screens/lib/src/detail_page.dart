import 'package:character_bloc/character_bloc.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCharacter =
        context.read<CharacterBloc>().state.selectedCharacter;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCharacter?.title ?? '',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            CachedImage(
              url: selectedCharacter?.imageUrl,
              height: 175,
              placeholder: Image.asset(
                'assets/images/placeholder.png',
                package: 'screens',
              ),
              errorWidget: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  height: 175,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(selectedCharacter?.description ?? ''),
          ],
        ),
      ),
    );
  }
}
