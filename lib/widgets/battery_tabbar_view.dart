import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';
import 'package:thermal/thermal.dart';
import '../utils/colors.dart';
import 'info.dart';

Container BatteryTabBarView(BuildContext context) {
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
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/battery.png',
                            width: 60,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: StreamBuilder<double>(
                            stream: Thermal()
                                .onBatteryTemperatureChanged
                                .asBroadcastStream(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return CircularProgressIndicator();
                              } else {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Battery',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${snapshot.data}°C",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        FutureBuilder<AndroidBatteryInfo?>(
                            future: BatteryInfoPlugin().androidBatteryInfo,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return info('Health',
                                    snapshot.data!.health!.toUpperCase());
                              }
                              return const CircularProgressIndicator();
                            }),
                        StreamBuilder<AndroidBatteryInfo?>(
                          stream: BatteryInfoPlugin()
                              .androidBatteryInfoStream
                              .asBroadcastStream(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  info('Level',
                                      ('${snapshot.data!.batteryLevel}%')),
                                  info(
                                      'Status',
                                      snapshot.data!.chargingStatus
                                          .toString()
                                          .split(".")[1]),
                                  info('Technology', snapshot.data!.technology),
                                  info('Voltage',
                                      ('${snapshot.data!.voltage} mv')),
                                ],
                              );
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ],
                    ),
                  ),
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
