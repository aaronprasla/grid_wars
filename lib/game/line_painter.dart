import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final List<int> winningCombo;
  final Animation<double> animation;
  final bool mark;

  LinePainter(this.winningCombo, this.animation, this.mark);

  @override
  void paint(Canvas canvas, Size size) {
    if (winningCombo.isEmpty) return;

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;

    final double cellSize = size.width / 3;

    final startX = (winningCombo.first % 3) * cellSize + cellSize / 1.9;
    final startY = (winningCombo.first ~/ 3) * cellSize + cellSize / 2;
    final endX = (winningCombo.last % 3) * cellSize + cellSize / 1.9;
    final endY = (winningCombo.last ~/ 3) * cellSize + cellSize / 2;

    final startPoint = Offset(startX, startY);
    final endPoint = Offset(endX, endY);
    final drawPoint = Offset.lerp(startPoint, endPoint, animation.value)!;

    canvas.drawLine(startPoint, drawPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
