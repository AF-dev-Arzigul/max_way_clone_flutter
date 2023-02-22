import 'dart:async';
import 'package:flutter/material.dart';
import 'package:max_way/api/Api.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'LocationService.dart';
import 'app_lang_lat.dart';
import 'models/MaxWayBranches.dart';


class BranchesPage extends StatefulWidget {
  const BranchesPage({Key? key}) : super(key: key);

  @override
  State<BranchesPage> createState() => _BranchesPageState();

}

class _BranchesPageState extends State<BranchesPage> {
  final _api = Api();
  late MaxWayBranches _response;
  var branches = <Branch>[];
  final mapControllerCompleter = Completer<YandexMapController>();
  final List<MapObject> mapObjects = [];
  bool progress = false;
  var selectedBranch = 0;

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
    getData();
  }

  Future<void> getData() async {
    _response = await _api.getBranches();
    branches = _response.pageProps.branches.branches;
    await setMarkers(branches);
    _moveToCurrentLocation(AppLatLong(
        lat: branches.first.location.lat, long: branches.first.location.long));
    progress = true;
    setState(() {});
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    // _moveToCurrentLocation(location);
  }

  Future<void> setMarkers(List<Branch> branches) async {
    for (var element in branches) {
      mapObjects.add(PlacemarkMapObject(
          mapId: MapObjectId(element.id),
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
              scale: 0.4,
              image: BitmapDescriptor.fromAssetImage(
                  "assets/images/location_pin.png")
          )),
          point: Point(
              latitude: element.location.lat,
              longitude: element.location.long)));
    }
    setState(() {});
  }

  Future<void> _moveToCurrentLocation(AppLatLong appLatLong) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MaxWay Branches"),
      ),
      body: YandexMap(
        onMapCreated: (controller) {
          mapControllerCompleter.complete(controller);
        },
        zoomGesturesEnabled: true,
        mapObjects: mapObjects,
      ),
    );
  }

}

