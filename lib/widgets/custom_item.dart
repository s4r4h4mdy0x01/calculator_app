import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.symbol});
  final String symbol;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('ss');
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        height: 50,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: updateColorContainer(symbol),
        ),
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(
                color: updateColorText(symbol),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }

  Color updateColorContainer(String s) {
    if (s == '=') {
      return Colors.orange.shade500;
    } else if (s == 'Del') {
      return Colors.red.shade400;
    } else if (s == 'C') {
      return Colors.teal.shade400;
    } else if (s == '/' || s == '*' || s == '-' || s == '+' || s == '%') {
      return Colors.grey.shade500;
    } else {
      return Colors.grey.shade200;
    }
  }

  Color updateColorText(String s) {
    if (s == 'C' ||
        s == 'Del' ||
        s == '/' ||
        s == '*' ||
        s == '-' ||
        s == '+' ||
        s == '%' ||
        s == '=') {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
