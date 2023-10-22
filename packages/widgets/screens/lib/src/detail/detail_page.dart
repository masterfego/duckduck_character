import 'package:character_bloc/character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screens/src/detail/character_detail.dart';

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
      body: const SafeArea(
        child: CharacterDetail(),
      ),
    );
  }
}
