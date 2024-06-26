import 'package:flutter/material.dart';

Row wetherAppBar(double width) {
  return Row(
    children: [
      const Icon(
        Icons.location_on_outlined,
        color: Colors.white,
        size: 25,
      ),
      SizedBox(
        width: width * 0.04,
      ),
      const Text(
        'Surat',
        style: TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      SizedBox(
        width: width * 0.03,
      ),

      SizedBox(
        width: width * 0.5,
      ),
      const Icon(
        Icons.menu,
        size: 25,
        color: Colors.white,
      ),

      SizedBox(
        width: width * 0.04,
      ),

      Icon(
        Icons.settings,
        size: 25,
        color: Colors.white,
      ),

    ],
  );
}
