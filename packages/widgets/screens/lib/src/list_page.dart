import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final String pageTitle;

  const ListPage({super.key, required this.pageTitle});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder(
        future: Future.sync(() => false),
        builder: (context, snapshot) {
          return Center(
            child: EmptyPage(
              imagePath: 'assets/images/oops.png',
              imagePackage: 'screens',
              title: 'Something went wrong',
              description:
                  'We were unable to retreive the data. please try again.',
              buttonLabel: 'Retry',
              onPressed: () {},
            ),
          );
        },
      )),
    );
  }
}
