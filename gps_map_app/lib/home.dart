import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlng;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Position currentPosition;    //현재위치
  late int kindChoice;              //어떤위치값을 선택했나
  late double lateData;             // 위도
  late double longData;             // 경도
  late MapController mapController; // 지도를 그려주는 컨트롤러
  late bool canRun;                 // 지도 데이터를 가져올수있나
  late List location;               // 위치값 문자 데이터

// Segment Widget

  Map<int, Widget> segmentWidget = {
    0: const SizedBox(
      child: Text(
        '현위치',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    ),
    1: const SizedBox(
      child: Text(
        '둘리뮤지엄',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    ),
    2: const SizedBox(
      child: Text(
        '서대문형무소역사관',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    kindChoice = 0;
    mapController = MapController();
    canRun = false;
    location = ['현재위치', '둘리뮤지엄', '서대문형무소역사관'];
    checkLocationPermission();
  }
  // 위치정보를 공유함에 동의하는지 체크
  checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      getCurrentLocation();
    }
  }
  // 현재 위치를 잡는 함수 
  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((position) {
      currentPosition = position;
      canRun = true;
      lateData = currentPosition.latitude;
      longData = currentPosition.longitude;
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Column(
            children: [
              const Text(
                'GPS & Map',
                style: TextStyle(color: Colors.black),
              ),
              CupertinoSegmentedControl(
                groupValue: kindChoice,
                children: segmentWidget,
                onValueChanged: (value) {
                  kindChoice = value;
                  if (kindChoice == 0) {
                    getCurrentLocation();
                    lateData = currentPosition.latitude;
                    longData = currentPosition.longitude;
                    mapController.move(latlng.LatLng(lateData, longData), 17.0);
                  } else if (kindChoice == 1) {
                    lateData = 37.65243153;
                    longData = 127.0276397;
                    mapController.move(latlng.LatLng(lateData, longData), 17.0);
                  } else {
                    lateData = 37.57244171;
                    longData = 127.9595412;
                    mapController.move(latlng.LatLng(lateData, longData), 17.0);
                  }
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
      body: canRun
          ? flutterMap()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // --Widget--
  Widget flutterMap() {
    return FlutterMap(
        mapController: mapController,
        options: MapOptions(
            initialCenter: latlng.LatLng(lateData, longData),
            initialZoom: 17.0),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(markers: [
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(lateData, longData),
              child: Column(
                children: [
                  Text(
                    location[kindChoice],
                    style: const TextStyle(
                      fontSize: 10,
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const Icon(
                    Icons.pin_drop,
                    size: 50,
                    color: Colors.red,
                  )
                ],
              ),
            )
          ])
        ]);
  }
}
