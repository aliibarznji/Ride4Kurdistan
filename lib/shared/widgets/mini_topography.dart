import 'package:flutter/material.dart';

class MiniTopography extends StatelessWidget {
  const MiniTopography({
    super.key,
    required this.size,
    required this.color,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          for (final scale in [1.0, 0.75, 0.5])
            Align(
              child: Container(
                width: size * scale,
                height: size * scale,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
