import 'package:flutter/material.dart';

import 'custom_box_widget.dart';

class CustomWidgetView extends StatelessWidget {
  const CustomWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modular Custom Widget')),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomBoxWidget(), SizedBox(width: 10), CustomBoxWidget()],
        ),
      ),
    );
  }
}
