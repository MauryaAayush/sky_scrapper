import 'package:flutter/material.dart';

Row wetherAppBar(double width) {
  return Row(
    children: [

      SizedBox(
        height: 80,
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

      // SizedBox(
      //   width: width * 0.5,
      // ),

      Spacer(),
      const Icon(
        Icons.menu,
        size: 25,
        color: Colors.white,
      ),

      SizedBox(
        width: width * 0.06,
      ),

      Icon(
        Icons.settings,
        size: 25,
        color: Colors.white,
      ),

      SizedBox(
        width: width * 0.04,
      ),

    ],
  );
}
