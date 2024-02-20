import 'package:flutter/material.dart';

import '../utils/colors.dart';

Padding info(String name, dynamic detail) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          detail ?? 'unknow',
          style: TextStyle(color: blue, fontSize: 16),
        ),
        const Divider(thickness: 1),
      ],
    ),
  );
}
