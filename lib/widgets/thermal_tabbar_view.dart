import 'package:flutter/material.dart';
import 'package:thermal/thermal.dart';

import 'info.dart';

class ThermalTabbarView extends StatelessWidget {
  const ThermalTabbarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 235, 228, 228),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 5),
              Container(
                width: MediaQuery.of(context).size.width - 10,
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
                    StreamBuilder<double>(
                      stream: Thermal()
                          .onBatteryTemperatureChanged
                          .asBroadcastStream(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return CircularProgressIndicator();
                        } else {
                          return info('Battery', "${snapshot.data}°C");
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
            ],
          )
        ],
      ),
    );
  }
}
