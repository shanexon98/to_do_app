import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/utils.dart';

class TextFormFieldDefault extends StatelessWidget {
  const TextFormFieldDefault({
    super.key,
    required TextEditingController textEditingController,
    required this.title,
    required this.textValidation,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;
  final String title;
  final String textValidation;
  @override
  Widget build(BuildContext context) {
    return BounceInUp(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          controller: _textEditingController,
          decoration: InputDecoration(
            labelText: title,
            labelStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.note_add_outlined,
              color: AppColors.secondary,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return textValidation;
            }
            return null;
          },
        ),
      ),
    );
  }
}
