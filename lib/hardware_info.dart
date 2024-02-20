import 'dart:async';
import 'dart:io';
import 'package:cpuz/widgets/battery_tabbar_view.dart';
import 'package:cpuz/widgets/device_tabbar_view.dart';
import 'package:cpuz/widgets/about.dart';
import 'package:cpuz/widgets/sensor_tabbar_view.dart';
import 'package:cpuz/widgets/soc_tabbar_view.dart';
import 'package:cpuz/widgets/system_tabbar_view.dart';
import 'package:cpuz/widgets/tab_bar.dart';
import 'package:cpuz/widgets/thermal_tabbar_view.dart';
import 'package:cpuz/widgets/title_appbar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CPUZ extends StatefulWidget {
  @override
  State<CPUZ> createState() => _CPUZState();
}

class _CPUZState extends State<CPUZ> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  late String _platform;
  final int megaByte = 1024 * 1024;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Map<String, dynamic> _readAndroidSystemAndDevice(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt.toString(),
      'version.release': 'Android ${build.version.release}',
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
          ("${(build.displayMetrics.sizeInches * 10).roundToDouble() / 10} inches")
              .toString(),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'screenSolution':
          '${build.displayMetrics.widthPx.toInt()} x ${build.displayMetrics.heightPx.toInt()} pixels',
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'screenDensity': "${build.displayMetrics.yDpi.toInt()} dpi",
      'serialNumber': build.serialNumber,
    };
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        _platform = 'Mobile';
        deviceData =
            _readAndroidSystemAndDevice(await deviceInfoPlugin.androidInfo);
      } else {
        _platform = "No Support";
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version'
      };
    }

    if (!mounted) return;
    setState(() {
      _deviceData = deviceData;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_platform == 'Mobile') {
      return SafeArea(
        child: DefaultTabController(
          length: 7,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 235, 228, 228),
              elevation: 0,
              title: const TitleAppBar(),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: TabBarCPU(),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                //Soc
                SocTabBarView(context),
                //Device
                DeviceTabBarView(context, _deviceData),
                //System
                SystemTabBarView(context, _deviceData),
                // Battery
                BatteryTabBarView(context),
                //Thermal
                const ThermalTabbarView(),
                //Sensor
                const SensorTabbarView(),
                const AboutWidget(),
              ],
            ),
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Ứng dụng chưa hỗ trợ thiết bị'),
        ),
      );
    }
  }
}
