//Sem mudança de estado
import 'package:app/src/controllers/app_controller.dart';
import 'package:app/src/pages/configuration.dart';
import 'package:app/src/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'src/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (builder, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: AppController.instance.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/home',
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage(),
            '/config': (context) => ConfigPage(),
          },
        );
      },
    );
  }
}
