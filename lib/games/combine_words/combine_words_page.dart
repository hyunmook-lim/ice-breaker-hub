import 'package:flutter/material.dart';

class CombineWordsPage extends StatelessWidget {
  const CombineWordsPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [SizedBox(width: 48)], // leading과 symmetry 맞추기용
      ),
      body: Expanded(
        child: Center(
          child: Container(
            color: Colors.blue[100],
            alignment: Alignment.center,
            child: const Text(
              '게임 뷰 영역',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
