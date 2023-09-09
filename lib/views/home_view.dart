import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String input = '';
  String output = '';
  List<String> symbols = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'Ans',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Calculator App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.on_device_training),
          ),
        ],
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: symbols.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return CustomItem(symbol: symbols[index]);
        },
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.symbol});
  final String symbol;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          style:  TextStyle(
              color: updateColorText(symbol), fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Color updateColorContainer(String s) {
    if (s == '=') {
      return Colors.orange.shade500;
    } else if (s == 'Del') {
      return Colors.red.shade500;
    } else if (s == 'C') {
      return Colors.green.shade200;
    } else if (s == '/' || s == '*' || s == '-' || s == '+' || s == '%') {
      return Colors.grey.shade700;
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
        s == '%') {
      return Colors.white;
    } else {
      return Colors.black12;
    }
  }
}
