import 'package:flutter/material.dart';

import 'custom_box_widget.dart';

class ColumnLayoutView extends StatelessWidget {
  const ColumnLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row and Column')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBoxWidget(),
            SizedBox(height: 10),
            CustomBoxWidget(),
            SizedBox(height: 10),
            CustomBoxWidget(),
          ],
        ),
      ),
    );
  }
}
