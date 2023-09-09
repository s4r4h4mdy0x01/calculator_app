import 'package:calculator_app/const_widget/consts.dart';

import 'package:calculator_app/widgets/input_output_custom.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

String input = '';
String output = '';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Calculator App',
          style: TextStyle(color: Colors.black),
        ),
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
          Expanded(
            flex: 5,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: kSymbols.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (kSymbols[index] == 'C') {
                      output = '';
                      input = '';
                      setState(() {});
                    } else if (kSymbols[index] == 'Del') {
                      input = input.substring(0, input.length - 1);
                      setState(() {});
                    } else if (kSymbols[index] == 'Ans') {
                      input = output;
                      output = '';
                      setState(() {});
                    } else if (kSymbols[index] == '%' ||
                        kSymbols[index] == '/' ||
                        kSymbols[index] == '*' ||
                        kSymbols[index] == '+' ||
                        kSymbols[index] == '-') {
                      if (input.endsWith("%") ||
                          input.endsWith("*") ||
                          input.endsWith("/") ||
                          input.endsWith("+") ||
                          input.endsWith("-")) {
                        //
                      } else {
                        setState(() {
                          input += kSymbols[index];
                        });
                      }
                    } else if (kSymbols[index] == '=') {
                      Parser p = Parser();
                      Expression exp = p.parse(input);
                      double eval =
                          exp.evaluate(EvaluationType.REAL, ContextModel());
                      setState(() {
                        output = eval.toString();
                      });
                    } else {
                      input += kSymbols[index];
                      setState(() {});
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: updateColorContainer(kSymbols[index]),
                    ),
                    child: Center(
                      child: Text(
                        kSymbols[index],
                        style: TextStyle(
                            color: updateColorText(kSymbols[index]),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
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
