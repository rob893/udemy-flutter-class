import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  final VoidCallback resetCallback;

  const Result(this.resultScore, this.resetCallback, {Key? key})
      : super(key: key);

  String get resultPhrase =>
      resultScore > 5 ? 'You are cool.' : 'You are lame.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: resetCallback, child: const Text('Restart Quiz!')),
        ],
      ),
    );
  }
}
