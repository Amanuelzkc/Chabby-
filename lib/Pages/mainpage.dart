import 'package:chappy/components/button.dart';
import 'package:chappy/models/calc.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController dollarController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController taxController = TextEditingController();

  double result = 0;

  CalculationLogic calculationLogic = CalculationLogic();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 27, 223),
        body: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const Text(
                  "Chabby",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: dollarController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.money),
                            hintText: "Dollar",
                            border: UnderlineInputBorder(),
                            iconColor: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: rateController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.rate_review),
                            hintText: "Rate",
                            border: UnderlineInputBorder(),
                            iconColor: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: taxController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.view_module),
                            hintText: "Tax",
                            border: UnderlineInputBorder(),
                            iconColor: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Calculatebtn(
                        onTap: () => calculateResult(),
                        child: const Icon(
                          Icons.calculate,
                          color: Color.fromARGB(255, 71, 245, 77),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Result: $result',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateResult() {
    double dollar = double.tryParse(dollarController.text) ?? 0;
    double rate = double.tryParse(rateController.text) ?? 0;
    double tax = double.tryParse(taxController.text) ?? 0;

    setState(() {
      result = calculationLogic.calculateResult(dollar, rate, tax);
    });
  }
}
