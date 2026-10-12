import 'package:flutter/material.dart';

import 'screen_arguments.dart';

class GameApiDetail extends StatelessWidget {
  const GameApiDetail({super.key});

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      backgroundColor: const Color(0xFFF94A29),
      appBar: AppBar(
        title: const Text('Detail Game'),
        backgroundColor: const Color(0xFFF94A29),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F8FB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: args.cover.isEmpty
                            ? const SizedBox(
                                height: 180,
                                child: Center(
                                  child: Icon(Icons.videogame_asset, size: 60),
                                ),
                              )
                            : Image.network(
                                args.cover,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox(
                                    height: 180,
                                    child: Center(
                                      child: Icon(Icons.broken_image, size: 50),
                                    ),
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        args.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 47, 72),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          args.shortDesc,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 0, 47, 72),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        args.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 47, 72),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFF4F8FB)),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 15,
                        color: Color(0xFFF4F8FB),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Kembali ke game',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFF4F8FB),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
