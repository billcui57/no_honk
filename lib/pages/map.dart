import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kREV = CameraPosition(
      target: LatLng(43.470191, -80.554370), zoom: 19.151926040649414);

  Set<Marker> dataBaseMarkers = Set();

  Set<Marker> newMarkers = Set();

  LatLng UWNorthEast = LatLng(43.475929, -80.534317);
  LatLng UWSouthWest = LatLng(43.462503, -80.556258);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        markers: dataBaseMarkers.union(newMarkers),
        onTap: (latlong) {
          setState(() {
            addMarkerAtPos(latlong);
          });
        },
        cameraTargetBounds: CameraTargetBounds(LatLngBounds(
          northeast: UWNorthEast,
          southwest: UWSouthWest,
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: pushChanges,
        label: Text('Push Changes!'),
        icon: Icon(Icons.person),
      ),
    );
  }

  Future<void> pushChanges() async {
     final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child("Attack Locations").set(
      {
        'title': 'Attack Locations',
        'list': dataBaseMarkers.union(newMarkers)
      }
      );
  }

  void _setStyle(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context)
        .loadString("assets/maps_style.json");
    controller.setMapStyle(value);
  }

  void addMarkerAtPos(LatLng latlong) {
    Marker temp = Marker(
      markerId: MarkerId(latlong.toString()),
      position: latlong,
      infoWindow: InfoWindow(
        title: 'I am a marker',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    );

    newMarkers.add(temp);

    
  }

 
   
  
}
