import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prime_numbers/core/context/text_styles.dart';

class Control extends StatefulWidget {
  const Control({super.key, this.controller, this.onPressed});

  final controller;
  final onPressed;

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter number of primes',
              hintText: '10',
            ),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: widget.onPressed,
          child: Text(
            'Generate Prime Numbers',
            style: AppTextStyle.buttonText(context),
          ),
        ),
      ],
    );
  }
}
