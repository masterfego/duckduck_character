import 'package:character_api/character_api.dart';
import 'package:character_bloc/character_bloc.dart';
import 'package:character_repository/character_repository.dart';
import 'package:configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screens/screens.dart';

void runSharedApp({required Configuration configuration}) {
  // Initialization
  final apiClient = CharacterApiClient(url: configuration.apiUrl);
  final repository = CharacterRepository(apiClient: apiClient);

  // Run app
  runApp(
    MaterialApp(
      title: configuration.homePageName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: configuration.appColor,
        ),
      ),
      home: BlocProvider(
        create: (_) => CharacterBloc(repository: repository),
        child: ListPage(pageTitle: configuration.homePageName),
      ),
    ),
  );
}
