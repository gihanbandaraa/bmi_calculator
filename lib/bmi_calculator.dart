import 'package:demo_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'gender_tile_widget.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  bool isMale = true;
  double height = 180; // in cm
  int weight = 74; // in kg
  int age = 19; // in years
  double bmi = 0.0;

  double calculateBMI(weight, height) {
    // BMI = weight (kg) / (height (m) * height (m))
    double heightInMeters = height / 100; // convert cm to m
    return weight / (heightInMeters * heightInMeters);
  }

  Color getBmiColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue; // Underweight
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green; // Normal weight
    } else if (bmi >= 25 && bmi < 29.9) {
      return Colors.orange; // Overweight
    } else {
      return Colors.red; // Obesity
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kActiveTextColor,
          ),
        ),
        backgroundColor: Colors.white10,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 10,
                        child: GenderTileWidget(
                          isMale: isMale,
                          text: "Male",
                          icon: Icons.male,
                          onTap: () {
                            isMale = true;
                            var bmiValue = calculateBMI(
                              weight,
                              height,
                            );
                            setState(() {
                              bmi = bmiValue;
                            });
                          },
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 10,
                        child: GenderTileWidget(
                          isMale: !isMale,
                          icon: Icons.female,
                          text: "Female",
                          onTap: () {
                            isMale = false;
                            var bmiValue = calculateBMI(
                              weight,
                              height,
                            );
                            setState(() {
                              bmi = bmiValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    decoration: kTileBorderDecoration,
                    child: Column(
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(
                            color: kActiveTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(height.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: kActiveTextColor,
                                )),
                            const Text(
                              "cm",
                              style: TextStyle(
                                color: kActiveTextColor,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          min: 100,
                          activeColor: kButtonColor,
                          max: 200,
                          value: height.toDouble(),
                          thumbColor: kButtonColor,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                              var bmiValue = calculateBMI(
                                weight,
                                height,
                              );
                              bmi = bmiValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Container(
                            decoration: kTileBorderDecoration,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const Text(
                                  "Weight",
                                  style: TextStyle(
                                    color: kActiveTextColor,
                                  ),
                                ),
                                Text("$weight",
                                    style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: kActiveTextColor,
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                        elevation: 0,
                                        backgroundColor: kActiveTextColor,
                                        shape: ShapeBorder.lerp(
                                          CircleBorder(),
                                          CircleBorder(),
                                          0.5,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (weight > 25) {
                                              weight--;
                                              var bmiValue =
                                                  calculateBMI(weight, height);
                                              bmi = bmiValue;
                                            }
                                          });
                                        },
                                        child: Icon(Icons.remove)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    FloatingActionButton(
                                        elevation: 0,
                                        shape: ShapeBorder.lerp(
                                          CircleBorder(),
                                          CircleBorder(),
                                          0.5,
                                        ),
                                        backgroundColor: kActiveTextColor,
                                        onPressed: () {
                                          setState(() {
                                            if (weight < 200) {
                                              weight++;
                                              var bmiValue =
                                                  calculateBMI(weight, height);
                                              bmi = bmiValue;
                                            }
                                          });
                                        },
                                        child: Icon(Icons.add)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 10,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: kTileBorderDecoration,
                            child: Column(
                              children: [
                                Text(
                                  "Age",
                                  style: TextStyle(
                                    color: kActiveTextColor,
                                  ),
                                ),
                                Text("$age",
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: kActiveTextColor,
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                        elevation: 0,
                                        shape: ShapeBorder.lerp(
                                          CircleBorder(),
                                          CircleBorder(),
                                          0.5,
                                        ),
                                        backgroundColor: kActiveTextColor,
                                        onPressed: () {
                                          setState(() {
                                            if (age > 10) {
                                              age--;
                                              var bmiValue =
                                                  calculateBMI(weight, height);
                                              bmi = bmiValue;
                                            }
                                          });
                                        },
                                        child: Icon(Icons.remove)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    FloatingActionButton(
                                        elevation: 0,
                                        shape: ShapeBorder.lerp(
                                          CircleBorder(),
                                          CircleBorder(),
                                          0.5,
                                        ),
                                        backgroundColor: kActiveTextColor,
                                        onPressed: () {
                                          setState(() {
                                            if (age < 100) {
                                              age++;
                                              var bmiValue =
                                                  calculateBMI(weight, height);
                                              bmi = bmiValue;
                                            }
                                          });
                                        },
                                        child: Icon(Icons.add)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: kTileBorderDecoration,
              child: Column(
                children: [
                  Text(
                    "Calculated BMI",
                    style: TextStyle(
                      color: kActiveTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(bmi.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: getBmiColor(bmi),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kButtonColor,
                        padding: EdgeInsets.all(20),
                        shape: const RoundedRectangleBorder(),
                      ),
                      onPressed: () {
                        final calculatedBmi = calculateBMI(weight, height);
                        setState(() {
                          bmi = calculatedBmi;
                        });
                      },
                      child: const Text("Calculate BMI",
                          style: TextStyle(
                            color: kButtonTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
