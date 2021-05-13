import 'package:app/src/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture:
                    ClipOval(child: Image.asset('assets/images/minhaFoto.png')),
                accountName: Text('Gabriel Arthur'),
                accountEmail: Text('gabriel.arthur2@gmail.com'),
              ),
              SwitchListTile(
                title: Text('Dark Mode'),
                onChanged: (bool value) {
                  setState(() {
                    AppController.instance.changeTheme();
                  });
                },
                value: AppController.instance.isDartTheme,
                secondary: const Icon(Icons.lightbulb_outline),
                activeColor: Colors.black,
                activeTrackColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
