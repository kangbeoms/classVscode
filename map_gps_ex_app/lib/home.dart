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
  late Position currentPosition; //현재위치
  late int kindChoice; //어떤위치값을 선택했나
  late double lateData; // 위도
  late double longData; // 경도
  late MapController mapController; // 지도를 그려주는 컨트롤러
  late bool canRun; // 지도 데이터를 가져올수있나
  late List location; // 위치값 문자 데이터

  @override
  void initState() {
    super.initState();
    kindChoice = 0;
    mapController = MapController();
    canRun = false;
    location = ['혜화문', '창의문', '흥인지문', '숙정문'];
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
        body: canRun
            ? flutterMap()
            : const Center(
                child: CircularProgressIndicator(),
              ));
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
              width: 60,
              height: 60,
              point:
                  latlng.LatLng(lateData = 37.5878892, longData = 127.0037098),
              child: Column(
                children: [
                  Text(
                    location[0],
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  const Icon(
                    Icons.pin_drop_outlined,
                    size: 40,
                    color: Colors.red,
                  )
                ],
              ),
            ),
            Marker(
              width: 60,
              height: 60,
              point:
                  latlng.LatLng(lateData = 37.5926027, longData = 126.9664771),
              child: Column(
                children: [
                  Text(
                    location[1],
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                        ),
                  ),
                  const Icon(
                    Icons.pin_drop_outlined,
                    size: 40,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            Marker(
              width: 60,
              height: 60,
              point:
                  latlng.LatLng(lateData = 37.5711907, longData = 127.009506),
              child: Column(
                children: [
                  Text(
                    location[2],
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  const Icon(
                    Icons.pin_drop_outlined,
                    size: 40,
                    color: Colors.blueGrey,
                  )
                ],
              ),
            ),
            Marker(
              width: 60,
              height: 60,
              point:
                  latlng.LatLng(lateData = 37.5956584, longData = 126.9810576),
              child: Column(
                children: [
                  Text(
                    location[3],
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown),
                  ),
                  const Icon(
                    Icons.pin_drop_outlined,
                    size: 40,
                    color: Colors.brown,
                  )
                ],
              ),
            ),
          ])
        ]
        );
  }
}
