import 'package:flutter/material.dart';

class LikeButtonDemo extends StatefulWidget {
  const LikeButtonDemo({super.key});

  @override
  State<LikeButtonDemo> createState() => _LikeButtonDemoState();
}

class _LikeButtonDemoState extends State<LikeButtonDemo> {
  bool _isLiked = false;
  int _likeCount = 10;

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likeCount--;
        _isLiked = false;
      } else {
        _likeCount++;
        _isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Like Button')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : Colors.grey,
                size: 48,
              ),
              onPressed: _toggleLike,
            ),
            Text('$_likeCount likes', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
