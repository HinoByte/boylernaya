import 'package:flutter/material.dart';

class SchemaScreen extends StatelessWidget {
  const SchemaScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text("Главный экран")),
      body: Center(
          child: Image(
        image: AssetImage('assets/images/schema.png'),
        fit: BoxFit.fill,
      )),
    );
  }

  backToMainScreen(context) {
    Navigator.pop(context);
  }
}
