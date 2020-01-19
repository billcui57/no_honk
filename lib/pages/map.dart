
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

 
  static final CameraPosition _kREV = CameraPosition(
      target: LatLng(43.470191, -80.554370),
      zoom: 19.151926040649414);




  LatLng UWNorthEast = LatLng(43.475929, -80.534317);
  LatLng UWSouthWest = LatLng(43.462503, -80.556258);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Geese Map'),
        backgroundColor: Theme.of(context).appBarTheme.color,
        textTheme: TextTheme(
                title: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kREV,
        onMapCreated: (GoogleMapController controller) {
          _setStyle(controller);
          _controller.complete(controller);
        },
        cameraTargetBounds: CameraTargetBounds(
          LatLngBounds(
            northeast: UWNorthEast,
            southwest: UWSouthWest,
          )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToREV,
        label: Text('To REV!'),
        icon: Icon(Icons.person),
      ),
    );
  }

  Future<void> _goToREV() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kREV));
  }

  void _setStyle(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context)
                           .loadString('assets/maps_style.json');
    controller.setMapStyle(value);
  }
}