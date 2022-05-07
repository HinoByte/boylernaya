import 'package:boylernaya/TableModule/TableModule.dart';
import 'package:boylernaya/screens/main_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginController.addListener(
      () {},
    );
    _passwordController.addListener(
      () {},
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await RecordTestLines().initDB();
      //     await RecordTestLines().addTestInfo();
      //   },
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150.0),
            child: Column(
              children: [
                TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                      hintText: "Login",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 35.0,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Builder(
                  builder: (context) => ButtonTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    minWidth: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        showMainScreen(context);
                      },
                      child: Text('Войти в систему'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  showMainScreen(context) async {
    bool checkPassword = await TableModule().checkPassword(
        context, _loginController.text, _passwordController.text);
    if (checkPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Неверный пароль'),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
