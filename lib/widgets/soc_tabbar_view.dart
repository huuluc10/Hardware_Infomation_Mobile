import 'package:cpuz/widgets/info.dart';
import 'package:flutter/material.dart';
import 'package:cpu_reader/cpu_reader.dart';
import 'package:cpu_reader/cpuinfo.dart';

import '../utils/colors.dart';

List<Row> buildFreqList(AsyncSnapshot<CpuInfo> snapshot) {
  return snapshot.data!.currentFrequencies!.entries
      .map(
        (entry) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CPU ${entry.key} '),
            Text('${entry.value}'),
          ],
        ),
      )
      .toList();
}

Container SocTabBarView(BuildContext context) {
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
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/cpu.png',
                            width: 60,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        FutureBuilder<CpuInfo>(
                          future: CpuReader.cpuInfo,
                          builder: (context, AsyncSnapshot<CpuInfo> snapshot) =>
                              info('Number of cores',
                                  '${snapshot.data?.numberOfCores}'),
                        ),
                        StreamBuilder<CpuInfo>(
                            stream:
                                CpuReader.cpuStream(1000).asBroadcastStream(),
                            builder: (_, AsyncSnapshot<CpuInfo> snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: buildFreqList(snapshot),
                                );
                              }
                              return const CircularProgressIndicator();
                            }),
                      ],
                    ),
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
