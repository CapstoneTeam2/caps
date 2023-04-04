import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Log in';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  Future<void> _loginButtonPressed() async {
    // String authCode = await AuthCodeClient.instance.request();
    // print(authCode);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [
            Container(
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'ID'
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'PASSWORD'
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
                child: Text('Log In'),
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NaverMapTest()));},
              ),
            ),
            SizedBox(
              height: 200,
            ),
            SizedBox(
              child: CupertinoButton(
                onPressed: _loginButtonPressed,
                color: Colors.yellow,
                child: Text(
                  '카카오 로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
