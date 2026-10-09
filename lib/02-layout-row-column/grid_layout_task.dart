import 'package:flutter/material.dart';

class GridLayoutTaskScreen extends StatelessWidget {
  const GridLayoutTaskScreen({super.key});

  Widget _buildGridTile({required Color boxColor, required String label}) {
    return Container(
      width: 85,
      height: 85,
      decoration: BoxDecoration(
        color: boxColor,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite, color: Colors.red, size: 32),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row and Column')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGridTile(boxColor: Colors.blue, label: 'Kotak 1'),
                const SizedBox(width: 10),
                _buildGridTile(boxColor: Colors.amber, label: 'Kotak 2'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGridTile(boxColor: Colors.green, label: 'Kotak 3'),
                const SizedBox(width: 10),
                _buildGridTile(boxColor: Colors.purple, label: 'Kotak 4'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
