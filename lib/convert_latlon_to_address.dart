import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class ConvertLongToAddress extends StatefulWidget {
  const ConvertLongToAddress({Key? key}) : super(key: key);

  @override
  State<ConvertLongToAddress> createState() => _ConvertLongToAddressState();
}

class _ConvertLongToAddressState extends State<ConvertLongToAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GOOGLE MAP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              final coordinates = new Coordinates(33.6992, 72.9744);
              var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
              var first = address.first;
              print(first.featureName.toString()+first.addressLine.toString());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: Center(
                  child: Text("Convert"),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
