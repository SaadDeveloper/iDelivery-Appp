import 'package:flutter/material.dart';
import 'package:idelivery_app/src/utils/constants.dart';
import 'package:idelivery_app/src/utils/widgets.dart';
import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SenderScreen extends StatefulWidget {
  const SenderScreen({super.key});

  @override
  State<SenderScreen> createState() => _SenderScreenState();
}

class _SenderScreenState extends State<SenderScreen> {
  final tomtomHQ = new LatLng(8.5060, 8.5227);
  final String apiKey = "V3GGMasC7VeGLIjoWRg8EcVJwdV20hMb";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mode of Delivery', style: kDeliveryTextStyle),
            SizedBox(height: 5),
            Container(
              height: 150,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DeliveryMode(color: Colors.black),
                  DeliveryMode(color: Colors.red),
                  DeliveryMode(color: Colors.blue),
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
                onTap: () {
                  showMaterialModalBottomSheet(
                    elevation: 10,
                    context: context,
                    builder: (context) => Container(
                      height: 450,
                      width: double.infinity,
                      //color: Colors.red,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: FlutterMap(
                        options: new MapOptions(center: tomtomHQ, zoom: 13.0),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://api.tomtom.com/map/1/tile/basic/main/"
                                "{z}/{x}/{y}.png?key={apiKey}",
                            additionalOptions: {"apiKey": apiKey},
                          ),
                          MarkerLayer(
                            markers: [
                              new Marker(
                                width: 50.0,
                                height: 50.0,
                                point: tomtomHQ,
                                builder: (BuildContext context) => const Icon(
                                    Icons.location_on,
                                    size: 60.0,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                child: LocationButton(text: "Reciever's Location?",isIconRequired: true,)),
            SizedBox(height: 25),
            LocationButton(
              text: "Sender's Location?",
              isIconRequired: true,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ImageTile(imageUrl: imageTile1),
                  SizedBox(
                    width: 10,
                  ),
                  ImageTile(imageUrl: imageTile2)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
