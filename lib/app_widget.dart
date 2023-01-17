import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scrollinfinity/core/ui/themes/theme_data.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}
