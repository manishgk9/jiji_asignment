import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'dart:math' as math;

class SearchBarField extends StatelessWidget {
  final String value;
  final VoidCallback onSend;
  final TextEditingController controller;

  const SearchBarField({
    super.key,
    required this.value,
    required this.onSend,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // bool isTextController = true;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ask anything...',

          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 36,
            minHeight: 36,
          ),
          suffixIcon: Transform.rotate(
            angle: math.pi / 0.0219,
            child: const Icon(Icons.send, color: AppColors.primary),
          ),
        ),
        style: const TextStyle(fontSize: 16),
        onSubmitted: (_) => onSend(),
      ),
    );
  }
}
