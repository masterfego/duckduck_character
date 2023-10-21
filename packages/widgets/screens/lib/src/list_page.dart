import 'package:character_bloc/character_bloc.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screens/screens.dart';

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
        child: characters.isNotEmpty
            ? ListView.separated(
                itemBuilder: (context, index) => CharacterTile(
                  title: characters[index].title,
                  onTap: () {
                    bloc.add(CharacterSelected(character: characters[index]));

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(),
                      ),
                    );
                  },
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: characters.length,
              )
            : Center(
                child: EmptyPage(
                  imagePath: 'assets/images/oops.png',
                  imagePackage: 'screens',
                  title: 'Something went wrong',
                  description:
                      'We were unable to retreive the data. please try again.',
                  buttonLabel: 'Retry',
                  onPressed: () {},
                ),
              ),
      ),
    );
  }
}
