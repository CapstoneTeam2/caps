import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import 'ScrollView.dart';

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
      body: Stack(
        children: [
          NaverMap(
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
          UnderView()
        ],
      ),
    );
  }
}
