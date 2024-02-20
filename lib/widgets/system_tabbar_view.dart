import 'package:flutter/material.dart';
import 'package:system_info2/system_info2.dart';
import '../utils/colors.dart';
import 'info.dart';

Container SystemTabBarView(
    BuildContext context, Map<String, dynamic> _deviceData) {
  final kernelArchitecture = SysInfo.rawKernelArchitecture;
  final int megaByte = 1024 * 1024;

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
                            'assets/android.png',
                            width: 60,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _deviceData['version.release'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'API Level ' +
                                      _deviceData['version.release'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
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
                        info('Android Version', _deviceData['version.release']),
                        info('API Level', _deviceData['version.sdkInt']),
                        info('Security Patch Level',
                            _deviceData['version.securityPatch']),
                        info('Bootloader', _deviceData['bootloader']),
                        info('Build ID', _deviceData['display']),
                        info('Kernel Architecture',
                            SysInfo.rawKernelArchitecture),
                        info('Kernel Version', SysInfo.kernelVersion),
                        info('Total RAM',
                            '${SysInfo.getTotalVirtualMemory() ~/ megaByte} MB'),
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
