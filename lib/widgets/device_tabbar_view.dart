import 'package:flutter/material.dart';

import 'info.dart';

Container DeviceTabBarView(
    BuildContext context, Map<String, dynamic> _deviceData) {
  return Container(
    color: const Color.fromARGB(255, 235, 228, 228),
    child: Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 5),
            Container(
              width: MediaQuery.of(context).size.width - 10,
              // height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  info('Model', _deviceData['model']),
                  info('Manufacturer', _deviceData['manufacturer']),
                  info('Brand', _deviceData['brand']),
                  info('Board', _deviceData['board']),
                  info('Hardware', _deviceData['hardware']),
                  info('Screen size', _deviceData['displaySizeInches']),
                  info('Screen Resolution', _deviceData['screenSolution']),
                  info('Screen Density', _deviceData['screenDensity']),
                ],
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
        Expanded(child: Container()),
      ],
    ),
  );
}
