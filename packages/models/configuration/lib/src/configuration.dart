import 'package:flutter/material.dart';

class Configuration {
  // INFO: Since we have only one environment, we can put the parameters here
  final String apiUrl;
  final String homePageName;
  final Color appColor;

  const Configuration({
    required this.apiUrl,
    required this.homePageName,
    required this.appColor,
  });
}
