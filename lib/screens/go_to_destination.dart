import 'dart:core';

import 'package:autoride/gen/assets.gen.dart';
import 'package:autoride/screens/payment_screen.dart';
import 'package:autoride/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../res/color_manager.dart';
import '../res/dimension_manager.dart';
import '../res/text_style_manager.dart';

class GoToDesination extends StatefulWidget {
  const GoToDesination({super.key});

  @override
  State<GoToDesination> createState() => _GoToDesinationState();
}

class _GoToDesinationState extends State<GoToDesination> {
  var paymentMessage;
  var firstCoordination = <LatLng>[
    const LatLng(51.507427, -0.128026),
    const LatLng(51.507265, -0.127959),
    const LatLng(51.5072, -0.1276),
  ];

  var secondCoordination = <LatLng>[
    const LatLng(51.5072, -0.1276),
    const LatLng(51.507192, -0.127426),
    const LatLng(51.506677, -0.127230),
    const LatLng(51.506704168729925, -0.1269160369752661)
  ];

  var firstMarkers = <Marker>[
    const Marker(
        point: LatLng(51.5072, -0.1276),
        child: Icon(
          Icons.location_on,
          color: Colors.blue,
          size: 40.0,
        )),
    Marker(
        point: const LatLng(51.507427, -0.128026),
        child: Image.asset(
          Assets.icons.mapCar.path,
          width: 60,
          height: 60,
        )),
    const Marker(
        point: LatLng(51.506704168729925, -0.1269160369752661),
        child: Icon(Icons.location_on, color: Colors.green, size: 40.0)),
  ];

  var secondMarkers = <Marker>[
    Marker(
        point: const LatLng(51.5072, -0.1276),
        child: Image.asset(
          Assets.icons.mapCar.path,
          width: 60,
          height: 60,
        )),
    const Marker(
        point: LatLng(51.506704168729925, -0.1269160369752661),
        child: Icon(Icons.location_on, color: Colors.green, size: 40.0)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    changeDisplay();
  }

  changeDisplay() async {
    await Future.delayed(const Duration(seconds: 5), () {});

    setState(() {
      firstCoordination = secondCoordination;
      firstMarkers = secondMarkers;
    });
  }

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;

      paymentMessage = message;

    return Scaffold(
      backgroundColor: ColorManager.mainBackGroundColor,
      appBar: AppBar(
        title: Text(
          "AutoRide",
          style: TextStyleManager.appBarText,
        ),
        centerTitle: true,
      ),
      // Drawer Builder
      drawer: buildDrawer(),
      body: Column(children: [
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.5,
            child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(51.5072, -0.1276),
                  initialZoom: 18.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  PolylineLayer(polylineCulling: false, polylines: [
                    Polyline(
                        points: polyBuilder(paymentMessage != null
                            ? secondCoordination
                            : firstCoordination),
                        color: Colors.blue,
                        strokeWidth: 9)
                  ]),
                  MarkerLayer(
                      markers: markerBuilder(paymentMessage != null
                          ? secondMarkers
                          : firstMarkers)),
                ])),
        Container(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "Distance to Destination: 3 mile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Amount: \$12 ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    message == true ? "Paid" : "Not Paind ",
                    style: TextStyle(
                        fontSize: 15,
                        color: message == true ? Colors.green : Colors.red),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 52,
                    width: 158,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorManager.buttonColor,
                        textStyle:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                  SizedBox(
                    height: 52,
                    width: 158,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorManager.buttonColor,
                        textStyle:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentScreen()));
                      },
                      child: const Text('Pay'),
                    ),
                  )
                ],
              )
            ],
          ),
        ))
      ]),
    );
  }

  polyBuilder(List coordination) {
    return coordination;
  }

  markerBuilder(marker) {
    return marker;
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: ColorManager.buttonColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: DimensionManager.large),
            child: Text('AutoRide', style: TextStyleManager.titleText),
          ),
        ),
        ListTile(title: Text("Home Page", style: TextStyleManager.titleText)),
        ListTile(
          title: Text("Profile", style: TextStyleManager.titleText),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
        )
      ]),
    );
  }
}
