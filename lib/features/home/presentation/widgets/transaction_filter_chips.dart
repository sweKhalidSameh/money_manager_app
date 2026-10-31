import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';

/// Horizontal row of filter chips. The first chip is selected by default.
/// [onSelected] reports the index of the tapped chip so the logic layer
/// can filter the transactions list later.
class TransactionFilterChips extends StatefulWidget {
  const TransactionFilterChips({
    super.key,
    required this.filters,
    this.onSelected,
  });

  final List<String> filters;
  final ValueChanged<int>? onSelected;

  @override
  State<TransactionFilterChips> createState() => _TransactionFilterChipsState();
}

class _TransactionFilterChipsState extends State<TransactionFilterChips> {
  int _selectedIndex = 0;

  void _select(int index) {
    setState(() => _selectedIndex = index);
    widget.onSelected?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == _selectedIndex;
          return GestureDetector(
            onTap: () => _select(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.secondaryColor
                    : AppColors.chipBackground,
                borderRadius: BorderRadius.circular(20),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.secondaryColor.withAlpha(70),
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                widget.filters[index],
                style: context.labelStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? AppColors.onSecondary
                      : AppColors.textSecondary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
