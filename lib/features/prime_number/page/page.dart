import 'package:flutter/material.dart';
import 'package:prime_numbers/features/prime_number/widgets/control.dart';
import 'package:prime_numbers/features/prime_number/widgets/prime_numbers.dart';

class PrimeNumberPage extends StatefulWidget {
  @override
  _PrimeNumberPageState createState() => _PrimeNumberPageState();
}

class _PrimeNumberPageState extends State<PrimeNumberPage> {
  final _controller = TextEditingController();
  List<int> primeNumbers = []; // List để lưu các số nguyên tố

  // Hàm kiểm tra số nguyên tố
  bool isPrime(int num) {
    if (num < 2) return false;
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) return false;
    }
    return true;
  }

  // Hàm tìm và in các số nguyên tố
  void findPrimeNumbers(int numbers) {
    int count = 0;
    int num = 2;
    primeNumbers.clear(); // Xóa danh sách số nguyên tố trước đó

    while (count < numbers) {
      if (isPrime(num)) {
        primeNumbers.add(num); // Thêm số nguyên tố vào danh sách
        count++;
      }
      num++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prime Number Generator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Control(
                controller: _controller,
                onPressed: () {
                  int? numbers = int.tryParse(_controller.text);
                  if (numbers != null && numbers > 0) {
                    setState(() {
                      findPrimeNumbers(numbers); // Tìm các số nguyên tố
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              PrimeNumbers(
                primeNumbers: primeNumbers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
