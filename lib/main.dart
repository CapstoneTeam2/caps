import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
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
                child: Text('로그인'),
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

class sheet extends StatefulWidget {
  const sheet({Key? key}) : super(key: key);

  @override
  State<sheet> createState() => _sheetState();
}

class _sheetState extends State<sheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController){
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("test")
              ],
            ),
          ),
        );
      },
    );
  }
}
