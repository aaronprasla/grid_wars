import 'package:flutter/material.dart';

class PlayerInfoRow extends StatelessWidget {
  const PlayerInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        _PlayerInfo(name: 'Player 1 Name', mark: 'X'),
        Spacer(flex: 1),
        _PlayerInfo(name: 'Player 2 Name', mark: 'O'),
        Spacer(),
      ],
    );
  }
}

class _PlayerInfo extends StatelessWidget {
  final String name;
  final String mark;

  const _PlayerInfo({required this.name, required this.mark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name),
        Icon(mark == 'X' ? Icons.close_rounded : Icons.circle_outlined),
        const Text('Score'),
      ],
    );
  }
}
