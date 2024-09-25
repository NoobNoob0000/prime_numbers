import 'package:flutter/material.dart';
import 'package:prime_numbers/core/core/context/text_styles.dart';

class PrimeNumbers extends StatelessWidget {
  PrimeNumbers({super.key, required this.primeNumbers});

  List<int> primeNumbers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 8.0, // Khoảng cách giữa các số
          runSpacing: 8.0, // Khoảng cách giữa các dòng khi xuống dòng
          children: primeNumbers
              .asMap()
              .entries
              .map((entry) => Text(
                    entry.key == primeNumbers.length - 1
                        ? '${entry.value}' // Số cuối không cần dấu ','
                        : '${entry.value},',
                    style: AppTextStyle.content(context),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
