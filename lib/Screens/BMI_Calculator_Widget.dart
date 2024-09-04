import 'package:bmi_calculator/custom%20widget/GenderWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ResultScreen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);
  static const String routeName = 'CalculatorScreen';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int slider_value = 100;
  int weight = 60;
  int age = 10;
  String selectedGender = '';

  double calculateBMI() {
    double heightInMeters = slider_value / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String getResult(double bmi) {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000022),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GenderWidget(
                      gender_name: "Male",
                      ico_n: Icons.male,
                      isSelected: selectedGender == "Male",
                      onTap: () {
                        setState(() {
                          selectedGender = "Male";
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: GenderWidget(
                      gender_name: "Female",
                      ico_n: Icons.female,
                      isSelected: selectedGender == "Female",
                      onTap: () {
                        setState(() {
                          selectedGender = "Female";
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xFF1c1c32)),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'Height',
                          style:
                              TextStyle(color: Color(0xFF71727e), fontSize: 25),
                        ),
                      ),
                      Text(
                        '$slider_value',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        value: slider_value.toDouble(),
                        onChanged: (value) {
                          slider_value = value.toInt();
                          setState(() {});
                        },
                        activeColor: Color(0xFFeb1455),
                        inactiveColor: Color(0xFF8b8c96),
                        max: 220,
                        label: "$slider_value",
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color(0xFF1c1c32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Text('Weight',
                                    style: TextStyle(
                                        color: Color(0xFF71727e),
                                        fontSize: 25)),
                              ),
                              Expanded(
                                child: Text('$weight',
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        weight++;

                                        setState(() {});
                                      },
                                      child: Icon(
                                        CupertinoIcons.plus,
                                        size: 30,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          backgroundColor: Color(0xFF4c4e5d)),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (weight > 1) weight--;
                                        setState(() {});
                                      },
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        size: 30,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          backgroundColor: Color(0xFF4c4e5d)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xFF1c1c32)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Text('Age',
                                    style: TextStyle(
                                        color: Color(0xFF71727e),
                                        fontSize: 25)),
                              ),
                              Expanded(
                                child: Text('$age',
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (age < 100) {
                                          age++;
                                        }

                                        setState(() {});
                                      },
                                      child: Icon(
                                        CupertinoIcons.plus,
                                        size: 30,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          backgroundColor: Color(0xFF4c4e5d)),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (age > 1) {
                                          age--;
                                        }
                                        setState(() {});
                                      },
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        size: 30,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          backgroundColor: Color(0xFF4c4e5d)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      double bmi = calculateBMI();
                      String result = getResult(bmi);
                      String interpretation = getInterpretation(bmi);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                    BMIcalc: bmi,
                                    resultText: result,
                                    interpretation: interpretation,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFeb1455),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
