import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'ChargerInfo.dart';
import 'RegisterCharger.dart';
import 'SettingButton.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';


class NaverMapTest extends StatefulWidget {
  final List<Marker> markers;

  const NaverMapTest({Key? key, required this.markers}) : super(key: key);
  @override
  _NaverMapTestState createState() => _NaverMapTestState();
}

class _NaverMapTestState extends State<NaverMapTest> {

  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  late NaverMapController _mapController;

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
                background: NaverMap(
                  mapType: _mapType,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.5055, 126.9573),
                    zoom: 14,
                  ),
                  markers: widget.markers,
                  onMapCreated: (controller) {
                    _mapController = controller;
                    _controller.complete(controller);
                  },
                ),
              ),
            ),
          ];
        },
        body: ScrollView(),
      ),
    );
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
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Color(0xffb3c7e8),
          automaticallyImplyLeading: false,
          pinned: false,
          floating: true,
          leading: null,
          title: TextField(
            focusNode: focusNode,
            controller: _filter,
            onChanged: (checkText) {},
            style: TextStyle(fontSize: 15, color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: '검색 ',
              hintStyle: TextStyle(
                  color: Colors.black45, fontWeight: FontWeight.bold),
              suffixIcon: IconButton(
                icon: Icon(Icons.cancel),
                color: Colors.black45,
                onPressed: () {
                  _searchText = "";
                  _filter.clear();
                },
              ),
              prefixIcon: Icon(Icons.search, color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color(0xffd9e2f4),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: 540),
            Align(
              alignment: Alignment(
                  Alignment.bottomRight.x - 0.04,
                  Alignment.bottomRight.y - 0.4),
              child: SpeedDial(
                animatedIcon: AnimatedIcons.menu_close,
                visible: true,
                curve: Curves.bounceIn,
                backgroundColor: Colors.indigo.shade900,
                children: [
                  SpeedDialChild(
                      child: const Icon(Icons.account_circle_rounded, color: Colors
                          .white,),
                      label: "내 정보",
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 13.0),
                      backgroundColor: Colors.indigo.shade900,
                      labelBackgroundColor: Colors.indigo.shade900,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings(),
                          ),
                        );
                      }
                  ),
                  SpeedDialChild(
                      child: const Icon(Icons.charging_station_outlined, color: Colors
                          .white,),
                      label: "충전소 등록",
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 13.0),
                      backgroundColor: Colors.indigo.shade900,
                      labelBackgroundColor: Colors.indigo.shade900,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings(),
                          ),
                        );
                      }
                  ),
                  SpeedDialChild(
                      child: const Icon(Icons.home_outlined, color: Colors.white,),
                      label: "내 충전소",
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 13.0),
                      backgroundColor: Colors.indigo.shade900,
                      labelBackgroundColor: Colors.indigo.shade900,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChargerInfo(),
                          ),
                        );
                      }
                  ),
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}