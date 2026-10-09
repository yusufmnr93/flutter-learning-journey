import 'package:flutter/material.dart';

import 'custom_box_widget.dart';

class SingleBoxView extends StatelessWidget {
  const SingleBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row and Column')),
      body: const Center(child: CustomBoxWidget()),
    );
  }
}
