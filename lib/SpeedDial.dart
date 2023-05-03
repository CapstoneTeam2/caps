import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:practice02/RegisterCharger.dart';
import 'ChargerInfo.dart';
import 'SettingButton.dart';

class SpeedDials extends StatelessWidget {
  const SpeedDials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(330,540,10,10),
      child: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        visible: true,
        curve: Curves.bounceIn,
        backgroundColor: Colors.indigo.shade900,
        children: [
          SpeedDialChild(
              child: const Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ),
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
              }),
          SpeedDialChild(
              child: const Icon(
                Icons.charging_station_outlined,
                color: Colors.white,
              ),
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
                    builder: (context) => IndivRegisterCharger(),
                  ),
                );
              }),
          SpeedDialChild(
              child: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              label: "충전소 정보",
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
              }),
        ],
      ),
    );
  }
}
