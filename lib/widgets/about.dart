import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'CPU-Z',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 21, 94, 153),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'for Android',
                          style: TextStyle(
                            color: blue,
                          ),
                        ),
                        const Text(
                          'Created By Nguyễn Hữu Lực',
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
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
}
