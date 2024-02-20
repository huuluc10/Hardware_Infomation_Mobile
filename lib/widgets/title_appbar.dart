import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 14),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Device Info',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
