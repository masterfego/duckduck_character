import 'package:configuration/configuration.dart';
import 'package:flutter/material.dart';

void runSharedApp({required Configuration configuration}) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(configuration.homePageName),
        ),
      ),
    ),
  );
}
