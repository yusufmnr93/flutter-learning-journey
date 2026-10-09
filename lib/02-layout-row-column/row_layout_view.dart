import 'package:flutter/material.dart';

import 'custom_box_widget.dart';

class RowLayoutView extends StatelessWidget {
  const RowLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row and Column')),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomBoxWidget(), CustomBoxWidget(), CustomBoxWidget()],
        ),
      ),
    );
  }
}
