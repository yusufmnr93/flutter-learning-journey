import 'package:flutter/material.dart';

import 'view/location_screen.dart';

// Pintu masuk Modul 12 dari Dashboard (pola sama seperti GameStoreMenu).
class GpsLocationMenu extends StatelessWidget {
  const GpsLocationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const LocationScreen();
  }
}
