import 'package:calculator_app/const_widget/consts.dart';
import 'package:calculator_app/widgets/custom_Grid_view.dart';
import 'package:calculator_app/widgets/custom_item.dart';
import 'package:calculator_app/widgets/input_output_custom.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String input = '5+8';
  String output = '13';

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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: InputOutputItem(
              text: input,
            ),
          ),
          Expanded(
            flex: 1,
            child: InputOutputItem(
              text: output,
              textAlign: TextAlign.right,
            ),
          ),
          const Expanded(flex: 5, child: CustomGridView(symbols: kSymbols)),
        ],
      ),
    );
  }
}
