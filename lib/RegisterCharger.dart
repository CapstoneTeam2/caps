import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'main.dart';

class IndivRegisterCharger extends StatefulWidget {
  @override
  _IndivRegisterChargerState createState() => _IndivRegisterChargerState();
}

class _IndivRegisterChargerState extends State<IndivRegisterCharger> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _registDateController = TextEditingController();
  final TextEditingController _registNumController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '대표자',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '대표자를 입력해주세요.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _registDateController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: '개업 년도, 월, 일',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '이메일을 입력해주세요.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              TextFormField(
                controller: _registNumController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '사업자등록번호',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '사업자등록번호를 입력해주세요.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _addressController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '주소',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '주소를 입력해주세요.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   _register();
                    // }
                  },
                  child: Text('등록확인'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    // 서버에 회원가입 정보 전송 및 처리
    String name = _nameController.text;
    String email = _registDateController.text;
    String password = _registNumController.text;
    String address = _addressController.text;
    // TODO: 서버 처리 코드 작성
  }
}

Future<LatLng?> getLatLngFromAddress(String address) async {
  List<Location> locations = await locationFromAddress(address);
  if (locations.isNotEmpty) {
    Location location = locations.first;
    return LatLng(location.latitude, location.longitude);
  } else {
    return null;
  }
}
