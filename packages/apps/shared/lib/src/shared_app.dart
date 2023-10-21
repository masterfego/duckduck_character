import 'package:configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:screens/screens.dart';

void runSharedApp({required Configuration configuration}) {
  runApp(
    MaterialApp(
      title: configuration.homePageName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: configuration.appColor,
        ),
      ),
      home: ListPage(pageTitle: configuration.homePageName),
    ),
  );
}
