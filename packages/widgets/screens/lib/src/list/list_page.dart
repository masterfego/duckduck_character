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
  final TextEditingController _searchController = TextEditingController();
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Type 2 char. to start seaching...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        context
                            .read<CharacterBloc>()
                            .add(CharacterSearchCleared());
                        setState(() {});
                      },
                    )
                  : null,
            ),
            onChanged: (text) {
              final searchTerm = text.trim();
              if (searchTerm.length >= 2) {
                context
                    .read<CharacterBloc>()
                    .add(CharacterSearched(searchTerm: searchTerm));
              }

              setState(() {});
            },
            onSubmitted: (text) {
              final searchTerm = text.trim();
              if (searchTerm.length >= 2) {
                context
                    .read<CharacterBloc>()
                    .add(CharacterSearched(searchTerm: searchTerm));
              }

              setState(() {});
            },
          ),
        ),
      ),
      bottomNavigationBar: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          // Perform search functionality here
        },
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 16),
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
