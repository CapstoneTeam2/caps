import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'RegisterCharger.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

class NaverMapTest extends StatefulWidget {
  @override
  _NaverMapTestState createState() => _NaverMapTestState();
}

class _NaverMapTestState extends State<NaverMapTest> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  late NaverMapController _mapController;
  List<Marker> _markers = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb3c7e8),
      body: NestedScrollView(
        physics: ClampingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 570,
              backgroundColor: Colors.white,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: NaverMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(37.5055, 126.9573),
                      zoom: 14,
                    ),
                    markers: _markers,
                    onMapCreated: (controller) {
                      _mapController = controller;
                    },
                  ),
                ),
              ),
            ),
          ];
        },
        body: ScrollView(),
      ),

    );
}

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }


}

class ScrollView extends StatefulWidget {
  const ScrollView({Key? key}) : super(key: key);

  @override
  State<ScrollView> createState() => _ScrollViewState();
}

class _ScrollViewState extends State<ScrollView> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";          //검색 문구
  // late NaverMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color(0xffb3c7e8),
          automaticallyImplyLeading: false,
          pinned: false,
          floating: true,
          leading: null,
          title: TextField(
            focusNode: focusNode,
            controller: _filter,
            onChanged: (checkText){},
            style: TextStyle(fontSize: 15,color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: '검색 ',
              hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),
              suffixIcon: IconButton(icon: Icon(Icons.cancel),color: Colors.black45, onPressed: () { _searchText = ""; _filter.clear(); },), //x버튼 누르면 초기화
              prefixIcon: Icon(Icons.search,color: Colors.black45),// 검색 아이콘
              border: OutlineInputBorder( // 검색창 테두리 스타일
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true, // 검색창 배경색 채우기
              fillColor: Color(0xffd9e2f4), // 검색창 배경색
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IndivRegisterCharger()));
                },
                child: Text('충전소 등록'),
              ),
            ),
            SizedBox(height: 20),
          ]),
        ),
      ],
    );
  }
}


