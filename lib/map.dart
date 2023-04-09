import 'dart:async';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NaverMapTest extends StatefulWidget {
  @override
  _NaverMapTestState createState() => _NaverMapTestState();
}

class _NaverMapTestState extends State<NaverMapTest> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";          //검색 문구

  _SearchScreenState(){
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 570,
              backgroundColor: Colors.white,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: NaverMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.5055, 126.9573),
                    zoom: 14,
                  ),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xff333232),
                expandedHeight: 600,
                automaticallyImplyLeading: false,
                pinned: false,
                floating: true,
                leading: null,
                title: TextField(
                  focusNode: focusNode,
                  controller: _filter,
                  onChanged: (checkText){},
                  style: TextStyle(fontSize: 15,color: Colors.white),//검색 한 값을 서버로 보내기 위함
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: '충전소 검색 : ', // 검색창 안내문구
                    hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    suffixIcon: IconButton(icon: Icon(Icons.cancel),color: Colors.white, onPressed: () { _searchText = ""; _filter.clear(); },), //x버튼 누르면 초기화
                    prefixIcon: Icon(Icons.search,color: Colors.white),// 검색 아이콘
                    border: OutlineInputBorder( // 검색창 테두리 스타일
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true, // 검색창 배경색 채우기
                    fillColor: Color(0xff828282), // 검색창 배경색
                  ),
                ),
            )
          ],
        ),
      ),
    );
}

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
