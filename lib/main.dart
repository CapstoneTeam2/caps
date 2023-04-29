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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          key: _formKey,
          children: [
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _idController,
              decoration: const InputDecoration(
                  labelText: 'ID'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '아이디를 입력해주세요.';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  labelText: 'PASSWORD'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '비밀번호를 입력해주세요.';
                }
                return null;
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('아직 회원이 아니라면?'),
                TextButton(onPressed: (){}, child: Text('여기를 클릭'))
              ],
            ),

            Center(
              child: ElevatedButton(
                child: Text('로그인'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NaverMapTest(markers: [],)));
                  // if (_formKey.currentState!.validate()) {
                  //   _register();
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => NaverMapTest()));
                  // }      //나중에 바꿀 것
                },
              ),
            ),

            SizedBox(
              height: 200,
            ),
            SizedBox(
              child: CupertinoButton(
                onPressed: (){},
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
  void _register() {
    String name = _idController.text;
    String password = _passwordController.text;
    // TODO: 서버 처리 코드 작성
  }
}

