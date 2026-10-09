import 'package:flutter/material.dart';

import 'custom_box_widget.dart';

class CombinedLayoutView extends StatelessWidget {
  const CombinedLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Combined Row & Column')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomBoxWidget(),
                SizedBox(width: 10),
                CustomBoxWidget(),
              ],
            ),
            SizedBox(height: 10),
            CustomBoxWidget(),
          ],
        ),
      ),
    );
  }
}
