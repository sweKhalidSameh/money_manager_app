import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';

/// A thin rounded progress bar that fills from the start side,
/// so it automatically fills from the right in RTL layouts.
class AppProgressBar extends StatelessWidget {
  const AppProgressBar({
    super.key,
    required this.value,
    required this.color,
    this.trackColor = AppColors.trackColor,
    this.height = 6,
  });

  /// Progress between 0.0 and 1.0.
  final double value;
  final Color color;
  final Color trackColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: Container(
        height: height,
        color: trackColor,
        alignment: AlignmentDirectional.centerStart,
        child: FractionallySizedBox(
          widthFactor: value.clamp(0.0, 1.0).toDouble(),
          child: Container(color: color),
        ),
      ),
    );
  }
}
