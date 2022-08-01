import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/about_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        centerTitle: true,
        leading: crossButton(context),
        title: const Text(
          "Our Location",
          style: TextStyle(color: AppColors.whitecolor),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Our Map Location"),
          ),
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                  maxZoom: 18.0,
                  center: LatLng(27.7172, 85.3240),
                  // bounds: LatLngBounds(LatLng(29.9711, 29.9711), LatLng(29.9711, 88.0803)),
                  zoom: 5),
              layers: [
                TileLayerOptions(
                  retinaMode: false,
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(markers: [
                  Marker(
                      // point: LatLng(26.815674, 87.263948),
                      point: LatLng(26.817868, 87.270098),
                      builder: (context) =>
                          // const Icon(
                          //     Icons.person_pin_circle_outlined,
                          //     size: 40,
                          //     color: Colors.red),
                          Column(
                            children: [
                              const Flexible(
                                flex: 8,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  // size: 15.0,
                                  // textDirection: hospitalDetails['hospitalName']!,
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 1,
                                child: GText(
                                  text: "Ghar Dailo",
                                  color: Colors.black,
                                  fontSize: 7,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ))
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
