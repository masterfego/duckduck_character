import 'package:character_bloc/character_bloc.dart';
import 'package:character_repository/character_repository.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;
  final ValueChanged<Character>? onTap;

  const CharacterList({super.key, required this.characters, this.onTap, vc});

  @override
  Widget build(BuildContext context) {
    final selectedCharacter = context.select(
      (CharacterBloc bloc) => bloc.state.selectedCharacter,
    );

    final loadingState = context.select(
      (CharacterBloc bloc) => bloc.state.state,
    );

    switch (loadingState) {
      case LoadingState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LoadingState.failure:
        return StatusView(
          imagePath: 'assets/images/oops.png',
          imagePackage: 'screens',
          title: 'Something went wrong',
          description: 'We were unable to retreive the data. please try again.',
          buttonLabel: 'Retry',
          onPressed: () =>
              context.read<CharacterBloc>().add(CharacterStarted()),
        );
      case LoadingState.completed:
        if (characters.isEmpty) {
          return StatusView(
            imagePath: 'assets/images/no-results.png',
            imagePackage: 'screens',
            title: 'No result',
            description:
                'No result was found.\n If you are seraching, please adjsut your serach term',
            buttonLabel: 'Reload',
            onPressed: () =>
                context.read<CharacterBloc>().add(CharacterStarted()),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) => CharacterTile(
              title: characters[index].title,
              onTap: () {
                onTap?.call(characters[index]);
              },
              isSelected: selectedCharacter?.title == characters[index].title,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: characters.length,
          );
        }
    }
  }
}
