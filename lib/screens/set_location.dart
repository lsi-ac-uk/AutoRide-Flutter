import 'package:autoride/gen/assets.gen.dart';
import 'package:autoride/screens/searching_car_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../res/color_manager.dart';
import '../res/dimension_manager.dart';
import '../res/text_style_manager.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {

  bool showDestination = false;
  bool gotoSearch = false;

  @override
  Widget build(BuildContext context) {
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
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolylineLayer(polylineCulling: false, polylines: showDestination? [
                  Polyline(points: [
                    const LatLng(51.5072, -0.1276),
                    const LatLng(51.507192, -0.127426),
                    const LatLng(51.506677, -0.127230),
                    const LatLng(51.506704168729925, -0.1269160369752661)
                  ], color: Colors.blue, strokeWidth: 9)
                ]: []),
                MarkerLayer(markers: showDestination == true? markerBuilder(): [
                  const Marker(
                      point: LatLng(51.5072, -0.1276),
                      child: Icon(Icons.location_on,
                          color: Colors.blue, size: 40.0)),
                  Marker(
                      point: const LatLng(51.506929, -0.128189),
                      child: Image.asset(
                        Assets.icons.mapCar.path,
                        width: 60,
                        height: 60,
                      )),
                  Marker(
                      point: const LatLng(51.507672, -0.127066),
                      child: Image.asset(
                        Assets.icons.mapCar.path,
                        width: 60,
                        height: 60,
                      )),
                  Marker(
                      point: const LatLng(51.507427, -0.128026),
                      child: Image.asset(
                        Assets.icons.mapCar.path,
                        width: 60,
                        height: 60,
                      )),
                  Marker(
                      point: const LatLng(51.506723, -0.127350),
                      child: Image.asset(
                        Assets.icons.mapCar.path,
                        width: 60,
                        height: 60,
                      )),
                  // const Marker(
                  //     point:
                  //         LatLng(51.506704168729925, -0.1269160369752661),
                  //     child: Icon(Icons.location_on,
                  //         color: Colors.green, size: 40.0)),
                ])
              ]),
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(DimensionManager.medium),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:
                          const Icon(Icons.pin_drop, color: Colors.black),
                      hintText: showDestination? "Your destination": "Your location",
                      hintStyle: TextStyleManager.textFieldCaption),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: ColorManager.buttonColor,
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {

                      if (gotoSearch == true){
                        gotoSearch = false;
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => const SearchingCarScreen()));

                      }

                      if(showDestination == false && gotoSearch == false){
                        showDestination = true;
                        gotoSearch = true;
                      }else{
                        showDestination = false;
                        gotoSearch = false;
                      }
                    });
                  },
                  child: Text(
                    showDestination? 'Set Your Destination': 'Set Your Location',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ))
      ]),
    );
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
        ListTile(title: Text("Profile", style: TextStyleManager.titleText))
      ]),
    );
  }
  markerBuilder(){
    return [
      const Marker(
          point: LatLng(51.5072, -0.1276),
          child: Icon(Icons.location_on,
              color: Colors.blue, size: 40.0)),
      Marker(
          point: const LatLng(51.506929, -0.128189),
          child: Image.asset(
            Assets.icons.mapCar.path,
            width: 60,
            height: 60,
          )),
      Marker(
          point: const LatLng(51.507672, -0.127066),
          child: Image.asset(
            Assets.icons.mapCar.path,
            width: 60,
            height: 60,
          )),
      Marker(
          point: const LatLng(51.507427, -0.128026),
          child: Image.asset(
            Assets.icons.mapCar.path,
            width: 60,
            height: 60,
          )),
      Marker(
          point: const LatLng(51.506723, -0.127350),
          child: Image.asset(
            Assets.icons.mapCar.path,
            width: 60,
            height: 60,
          )),
      const Marker(
          point:
          LatLng(51.506704168729925, -0.1269160369752661),
          child: Icon(Icons.location_on,
              color: Colors.green, size: 40.0)),
    ];
  }
}
