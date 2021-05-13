import 'package:flutter/material.dart';
import 'package:app/src/controllers/app_controller.dart';

//Mudança de estado (setState)
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final controller = AppController();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                child: Image.asset('assets/images/minhaFoto.png'),
              ),
              accountName: Text(
                'Gabriel Arthur',
                style: (TextStyle(fontSize: 20)),
              ),
              accountEmail: null,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                Navigator.of(context).pushNamed('/config');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.start();
            },
          )
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}

_success() {
  return ListView.builder(
    itemCount: controller.todos.length,
    itemBuilder: (context, index) {
      var todo = controller.todos[index];
      return ListTile(
        leading: Checkbox(
          value: todo.completed,
          onChanged: (bool value) {},
        ),
        title: Text(todo.title),
      );
    },
  );
}

_error() {
  return Center(
    child: RaisedButton(
      onPressed: () {
        controller.start();
      },
      child: Text('Tentar Novamente'),
    ),
  );
}

_loading() {
  return Center(child: CircularProgressIndicator());
}

_start() {
  return Container();
}

stateManagement(HomeState state) {
  switch (state) {
    case HomeState.start:
      return _start();
    case HomeState.loading:
      return _loading();
    case HomeState.error:
      return _error();
    case HomeState.success:
      return _success();
    default:
      return _start();
  }
}
