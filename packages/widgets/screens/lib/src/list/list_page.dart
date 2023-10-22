import 'package:character_bloc/character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screens/screens.dart';
import 'package:screens/src/detail/character_detail.dart';
import 'package:screens/src/list/character_list.dart';
import 'dart:math';

class ListPage extends StatefulWidget {
  final String pageTitle;

  const ListPage({super.key, required this.pageTitle});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late CharacterBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = context.read<CharacterBloc>();
    bloc.add(CharacterStarted());
  }

  // Getting this logic from various forums of this topic
  // We could use an external package to detect devide type
  bool checkIsTablet(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var diagonal =
        sqrt((size.width * size.width) + (size.height * size.height));
    return diagonal > 1100.0;
  }

  @override
  Widget build(BuildContext context) {
    final characters = context.select(
      (CharacterBloc bloc) => bloc.state.filteredCharacters,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SafeArea(
        child: checkIsTablet(context)
            ? Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CharacterList(
                      characters: characters,
                      onTap: (character) {
                        bloc.add(CharacterSelected(character: character));
                      },
                    ),
                  ),
                  const VerticalDivider(),
                  const Expanded(flex: 2, child: CharacterDetail())
                ],
              )
            : CharacterList(
                characters: characters,
                onTap: (character) {
                  bloc.add(CharacterSelected(character: character));

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DetailPage(),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
