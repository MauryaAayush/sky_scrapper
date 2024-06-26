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
      Stack(
        children: [
          const Icon(
            Icons.menu,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 25,
            color: Colors.white,
          ),
          Positioned(
            left: 13,
            top: 5,
            child: Container(
              height: 7,
              width: 7,
              decoration: const BoxDecoration(
                  color: Colors.redAccent, shape: BoxShape.circle),
            ),
          )
        ],
      )
    ],
  );
}
