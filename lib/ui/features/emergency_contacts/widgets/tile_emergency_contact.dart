import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileEmergencyContact extends StatelessWidget {
  final String img;
  final String contactName;
  final String contactNumber;
  final GestureTapCallback onTap;

  const TileEmergencyContact({
    super.key,
    required this.img,
    required this.contactName,
    required this.contactNumber, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(img, width: 58, height: 58,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(contactName),
              Text(contactNumber),
            ],
          ),
        ),
        ElevatedButton.icon(onPressed: onTap, label: Text('Ligar'), icon: Icon(Icons.phone_outlined),)
        
      ],
    );
  }
}
