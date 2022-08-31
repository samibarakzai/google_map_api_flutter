import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Completer<GoogleMapController> _controller=Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(24.869754, 66.995759),
    zoom: 14,
  );

  List<Marker> _marker =[];
  List<Marker> _list =  [
    Marker(
        markerId: MarkerId('1'),
      position: LatLng(24.869754, 66.995759),
      infoWindow: InfoWindow(
        title: 'My Location'
      )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(24.863562, 66.997873),
        infoWindow: InfoWindow(
            title: 'Baghdadi'
        )
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(24.868702, 67.005534),
        infoWindow: InfoWindow(
            title: 'UNIVERSITY'
        )
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(35.980124, 51.056711),
        infoWindow: InfoWindow(
            title: 'IRAN'
        )
    ),
  ];


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          markers: Set<Marker>.of(_marker),
          mapType: MapType.satellite,
          myLocationEnabled: true,
          compassEnabled: true,
          onMapCreated: (GoogleMapController controller){
     _controller.complete(controller);
          },
            initialCameraPosition: _kGooglePlex,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async{
          GoogleMapController controller= await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(35.980124, 51.056711))
          ));
        },
      ),
    );
  }
}
